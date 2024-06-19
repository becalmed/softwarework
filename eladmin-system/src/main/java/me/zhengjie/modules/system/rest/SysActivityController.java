/*
 *  Copyright 2019-2020 Zheng Jie
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package me.zhengjie.modules.system.rest;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.zhengjie.annotation.Log;
import me.zhengjie.exception.BadRequestException;
import me.zhengjie.modules.system.domain.ActivityFeedback;
import me.zhengjie.modules.system.domain.ActivityUser;
import me.zhengjie.modules.system.domain.Reply;
import me.zhengjie.modules.system.domain.SysActivity;
import me.zhengjie.modules.system.domain.vo.ActivityQueryCriteria;
import me.zhengjie.modules.system.service.*;
import me.zhengjie.utils.PageResult;
import me.zhengjie.utils.PageUtil;
import me.zhengjie.utils.SecurityUtils;
import me.zhengjie.utils.StringUtils;
import org.apache.ibatis.transaction.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * @author Zheng Jie
 * @date 2019-03-29
 */
@RestController
@RequiredArgsConstructor
@Api(tags = "系统：活动管理")
@RequestMapping("/api/activity")
public class SysActivityController {


    private final SysActivityService sysActivityService;
    private final ActivityUserService activityUserService;
    private final ResourceRequirementsService resourceRequirementsService;
    private static final String ENTITY_NAME = "activity";
    private final UserService userService;
    private final ActivityFeedbackService activityFeedbackService;
    private final ReplyService replyService;




    @ApiOperation("查询活动")
    @GetMapping
    public ResponseEntity<PageResult<SysActivity>> querySysActivity(ActivityQueryCriteria criteria, Page<SysActivity> page) {

        return new ResponseEntity<>(sysActivityService.queryAll(criteria, page), HttpStatus.OK);
    }

    @ApiOperation("查询活动我创建的活动")
    @GetMapping("/create")
    public ResponseEntity<PageResult<SysActivity>> myCreate(ActivityQueryCriteria criteria, Page<SysActivity> page) {
        criteria.setCreateBy(SecurityUtils.getCurrentUserId().intValue());
        return new ResponseEntity<>(sysActivityService.queryAll(criteria, page), HttpStatus.OK);
    }

    @ApiOperation("查询我加入的活动")
    @GetMapping("/my")
    public ResponseEntity<PageResult<SysActivity>> my(ActivityQueryCriteria criteria, Page<SysActivity> page) {
        LambdaQueryWrapper<SysActivity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.inSql(SysActivity::getActivityId,"select activity_id from activity_user where user_id = "+SecurityUtils.getCurrentUserId());
        Page<SysActivity> ipage = sysActivityService.page(page,queryWrapper);
        for(SysActivity activity : ipage.getRecords()){
            activity.setUser(userService.findById(activity.getCreateBy()));
            activity.setResourceRequirements(resourceRequirementsService.getById(activity.getRid()));
        }
        return new ResponseEntity<>(PageUtil.toPage(ipage.getRecords(), ipage.getTotal()), HttpStatus.OK);
    }
    @ApiOperation("查询活动详情")
    @GetMapping("/get")
    public ResponseEntity<Object> get(Integer id) {
        SysActivity sysActivity = sysActivityService.getById(id);
        sysActivity.setUser(userService.findById(sysActivity.getCreateBy()));
        sysActivity.setResourceRequirements(resourceRequirementsService.getById(sysActivity.getRid()));
        if(sysActivity.getCreateBy()==SecurityUtils.getCurrentUserId().intValue()){
            sysActivity.setCheckUserType("活动创建者");
        }else{
            LambdaQueryWrapper<ActivityUser> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(ActivityUser::getUserId,SecurityUtils.getCurrentUserId().intValue());
            queryWrapper.eq(ActivityUser::getActivityId,sysActivity.getActivityId());
            long count = activityUserService.count(queryWrapper);
            if(count==0){
                sysActivity.setCheckUserType("可报名");
            }else{
                sysActivity.setCheckUserType("已参与该活动");
            }
        }
        return new ResponseEntity<>(sysActivity, HttpStatus.OK);
    }

    @ApiOperation("报表")
    @GetMapping("/charts")
    public ResponseEntity<Object> charts(Integer id) {
        SysActivity sysActivity = sysActivityService.getById(id);
        LambdaQueryWrapper<ActivityUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ActivityUser::getUserId,SecurityUtils.getCurrentUserId().intValue());
        queryWrapper.eq(ActivityUser::getActivityId,sysActivity.getActivityId());
        long count = activityUserService.count(queryWrapper);

        LambdaQueryWrapper<Reply> queryWrapper3 = new LambdaQueryWrapper<>();
        queryWrapper3.eq(Reply::getDid,sysActivity.getActivityId());
        long  replyCount = replyService.count(queryWrapper3);

        LambdaQueryWrapper<ActivityFeedback> queryWrapper4 = new LambdaQueryWrapper<>();
        queryWrapper4.eq(ActivityFeedback::getActivityId,sysActivity.getActivityId());
        long  feedbackCount = activityFeedbackService.count(queryWrapper4);


        List<Map<String, Object>> chart = activityUserService.charts(sysActivity.getActivityId());

        String[] status = new String[]{"非常满意","满意","一般","不满意"};
        List<Map<String, Object>> feedback = new ArrayList<>();

        for(String s : status){
            LambdaQueryWrapper<ActivityFeedback> queryWrapper1 = new LambdaQueryWrapper<>();
            queryWrapper1.eq(ActivityFeedback::getActivityId,sysActivity.getActivityId());
            queryWrapper1.eq(ActivityFeedback::getContent,s);
            long c = activityFeedbackService.count(queryWrapper1);
            Map<String, Object> map = new HashMap<>();
            map.put("value",c);
            map.put("name",s);
            feedback.add(map);
        }
        Map map = new HashMap();
        map.put("userCount",count);
        map.put("status",status);
        map.put("pieChart",chart);
        map.put("data",feedback);
        map.put("replyCount",replyCount);
        map.put("feedbackCount",feedbackCount);


        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @Log("新增活动")
    @ApiOperation("新增活动")
    @PostMapping
    public ResponseEntity<Object> createSysActivity(@Validated @RequestBody SysActivity resources) {
        int rid = sysActivityService.random(resources.getRtypeTemp(), resources.getStartTime(), resources.getEndTime());
        if (rid == -1) {
            throw new BadRequestException("该时间段该类所有资源已被使用！");
        }
        resources.setCreateBy(SecurityUtils.getCurrentUserId().intValue());
        resources.setRid(rid);
        resources.setCreateTime(new Date());
        sysActivityService.save(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @Log("修改活动")
    @ApiOperation("修改活动")
    @PutMapping
    public ResponseEntity<Object> updateSysActivity(@RequestBody SysActivity resources) {
        resources.setCreateBy(SecurityUtils.getCurrentUserId().intValue());
        resources.setUpdateTime(new Date());
        SysActivity old = sysActivityService.getById(resources.getActivityId());
        int oldRid = -1;
        if (old.getRid() != null) {
            oldRid = old.getRid();
            old.setRid(-1);
            sysActivityService.updateById(old);
        }
        int rid = sysActivityService.random(resources.getRtypeTemp(), resources.getStartTime(), resources.getEndTime());
        if (rid == -1) {
            if (oldRid != -1) {
                old.setRid(oldRid);
                sysActivityService.updateById(old);
            }
            throw new BadRequestException("该时间段该类所有资源已被使用！");
        }
        resources.setRid(rid);
        sysActivityService.updateById(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @Log("删除活动")
    @ApiOperation("删除活动")
    @DeleteMapping
    public ResponseEntity<Object> deleteSysActivity(@RequestBody Set<Long> ids) {
        for (Long id : ids) {
            sysActivityService.removeById(id);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }
}