/*
*  Copyright 2019-2023 Zheng Jie
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
import me.zhengjie.annotation.Log;
import me.zhengjie.domain.vo.EmailVo;
import me.zhengjie.modules.system.domain.ActivityUser;
import me.zhengjie.modules.system.domain.Message;
import me.zhengjie.modules.system.domain.SysActivity;
import me.zhengjie.modules.system.domain.User;
import me.zhengjie.modules.system.service.ActivityUserService;
import me.zhengjie.modules.system.domain.vo.ActivityUserQueryCriteria;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

import me.zhengjie.modules.system.service.MessageService;
import me.zhengjie.modules.system.service.SysActivityService;
import me.zhengjie.modules.system.service.UserService;
import me.zhengjie.service.EmailService;
import me.zhengjie.utils.PageUtil;
import me.zhengjie.utils.SecurityUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.zhengjie.utils.PageResult;

/**
* 
* @date 2024-06-13
**/
@RestController
@RequiredArgsConstructor
@Api(tags = "活动用户管理")
@RequestMapping("/api/activityUser")
public class ActivityUserController {

    private final ActivityUserService activityUserService;

    private final SysActivityService activityService;

    private final UserService userService;
    private final EmailService emailService;
    private final MessageService messageService;



    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    public void exportActivityUser(HttpServletResponse response, ActivityUserQueryCriteria criteria) throws IOException {
        activityUserService.download(activityUserService.queryAll(criteria), response);
    }

    @GetMapping
    @Log("查询活动用户")
    @ApiOperation("查询活动用户")
    public ResponseEntity<PageResult<ActivityUser>> queryActivityUser(ActivityUserQueryCriteria criteria, Page page){
        LambdaQueryWrapper<ActivityUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ActivityUser::getActivityId,criteria.getActivityId());
        if(criteria.getUserId()!=null)
            queryWrapper.eq(ActivityUser::getUserId,criteria.getUserId());

        Page<ActivityUser> ipage = activityUserService.page(page,queryWrapper);
        for(ActivityUser activityFeedback : ipage.getRecords()){
            activityFeedback.setUser(userService.findById(activityFeedback.getUserId()));
            activityFeedback.setActivity(activityService.getById(activityFeedback.getActivityId()));
        }
        return new ResponseEntity<>(PageUtil.toPage(ipage.getRecords(), ipage.getTotal()), HttpStatus.OK);
    }

    @PostMapping
    @Log("新增活动用户")
    @ApiOperation("新增活动用户")
    public ResponseEntity<Object> createActivityUser(@Validated @RequestBody ActivityUser resources){
        resources.setStatus("通过");
        resources.setUserId(SecurityUtils.getCurrentUserId().intValue());
        User user = userService.findById(SecurityUtils.getCurrentUserId().intValue());
        SysActivity activity = activityService.getById(resources.getActivityId());
        if(user.getMessageType().equals("站内消息")){
            Message message = new Message();
            message.setCreateUser(activity.getCreateBy());
            message.setUid(SecurityUtils.getCurrentUserId().intValue());
            message.setTitle("活动报名成功");
            message.setContent("恭喜你成功报名活动："+activity.getActivityName());
            messageService.save(message);
        }else{
            EmailVo emailVo = new EmailVo();
            List<String> list = new ArrayList<>();
            list.add(user.getEmail());
            emailVo.setTos(list);
            emailVo.setSubject("活动报名成功");
            emailVo.setContent("恭喜你成功报名活动："+activity.getActivityName());
            emailService.send(emailVo,emailService.find());
        }
        activityUserService.save(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改活动用户")
    @ApiOperation("修改活动用户")
    public ResponseEntity<Object> updateActivityUser(@Validated @RequestBody ActivityUser resources){
        activityUserService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除活动用户")
    @ApiOperation("删除活动用户")
    public ResponseEntity<Object> deleteActivityUser(@RequestBody List<Integer> ids) {
        activityUserService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}