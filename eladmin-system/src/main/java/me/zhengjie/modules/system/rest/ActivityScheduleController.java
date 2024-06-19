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
import me.zhengjie.modules.system.domain.*;
import me.zhengjie.modules.system.service.*;
import me.zhengjie.modules.system.domain.vo.ActivityScheduleQueryCriteria;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

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
* @author fjw
* @date 2024-06-19
**/
@RestController
@RequiredArgsConstructor
@Api(tags = "活动日程管理")
@RequestMapping("/api/activitySchedule")
public class ActivityScheduleController {

    private final ActivityScheduleService activityScheduleService;
    private final SysActivityService activityService;
    private final ActivityUserService activityUserService;
    private final UserService userService;
    private final EmailService emailService;
    private final MessageService messageService;

    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    public void exportActivitySchedule(HttpServletResponse response, ActivityScheduleQueryCriteria criteria) throws IOException {
        activityScheduleService.download(activityScheduleService.queryAll(criteria), response);
    }

    @GetMapping
    @Log("查询活动日程")
    @ApiOperation("查询活动日程")
    public ResponseEntity<PageResult<ActivitySchedule>> queryActivitySchedule(ActivityScheduleQueryCriteria criteria, Page page){
        LambdaQueryWrapper<ActivitySchedule> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ActivitySchedule::getAid,criteria.getActivityId());

        Page<ActivitySchedule> ipage = activityScheduleService.page(page,queryWrapper);
        for(ActivitySchedule activitySchedule : ipage.getRecords()){
            activitySchedule.setActivity(activityService.getById(activitySchedule.getAid()));
        }
        return new ResponseEntity<>(PageUtil.toPage(ipage.getRecords(), ipage.getTotal()), HttpStatus.OK);
    }

    @PostMapping
    @Log("新增活动日程")
    @ApiOperation("新增活动日程")
    public ResponseEntity<Object> createActivitySchedule(@Validated @RequestBody ActivitySchedule resources){

        activityScheduleService.create(resources);
        LambdaQueryWrapper<ActivityUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ActivityUser::getActivityId,resources.getAid());
        List<ActivityUser> activityUserList = activityUserService.list(queryWrapper);
        for(ActivityUser activityUser:activityUserList){
            SysActivity activity = activityService.getById(activityUser.getActivityId());
            User user = userService.findById(activityUser.getUserId());
            if(user.getMessageType().equals("站内消息")){
                Message message = new Message();
                message.setCreateUser(activity.getCreateBy());
                message.setUid(SecurityUtils.getCurrentUserId().intValue());
                message.setTitle("活动:"+activity.getActivityName()+"有新的日程了");
                message.setContent("日程："+ resources.getTitle()+"\n");
                messageService.save(message);
            }else{
                EmailVo emailVo = new EmailVo();
                List<String> list = new ArrayList<>();
                list.add(user.getEmail());
                emailVo.setTos(list);
                emailVo.setSubject("活动:"+activity.getActivityName()+"有新的日程了");
                emailVo.setContent("日程："+ resources.getTitle()+"\n");
                emailService.send(emailVo,emailService.find());
            }
        }
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改活动日程")
    @ApiOperation("修改活动日程")
    public ResponseEntity<Object> updateActivitySchedule(@Validated @RequestBody ActivitySchedule resources){
        activityScheduleService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除活动日程")
    @ApiOperation("删除活动日程")
    public ResponseEntity<Object> deleteActivitySchedule(@RequestBody List<Integer> ids) {
        activityScheduleService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}