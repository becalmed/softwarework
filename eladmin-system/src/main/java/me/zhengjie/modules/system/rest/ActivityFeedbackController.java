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
import me.zhengjie.modules.system.domain.ActivityCost;
import me.zhengjie.modules.system.domain.ActivityFeedback;
import me.zhengjie.modules.system.service.ActivityFeedbackService;
import me.zhengjie.modules.system.domain.vo.ActivityFeedbackQueryCriteria;
import lombok.RequiredArgsConstructor;
import java.util.List;

import me.zhengjie.modules.system.service.SysActivityService;
import me.zhengjie.modules.system.service.UserService;
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
@Api(tags = "活动反馈管理")
@RequestMapping("/api/activityFeedback")
public class ActivityFeedbackController {

    private final ActivityFeedbackService activityFeedbackService;
    private final SysActivityService activityService;

    private final UserService userService;

    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    public void exportActivityFeedback(HttpServletResponse response, ActivityFeedbackQueryCriteria criteria) throws IOException {
        activityFeedbackService.download(activityFeedbackService.queryAll(criteria), response);
    }

    @GetMapping
    @Log("查询活动反馈")
    @ApiOperation("查询活动反馈")
    public ResponseEntity<PageResult<ActivityFeedback>> queryActivityFeedback(ActivityFeedbackQueryCriteria criteria, Page page){
        LambdaQueryWrapper<ActivityFeedback> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ActivityFeedback::getActivityId,criteria.getActivityId());
        if(criteria.getUserId()!=null)
            queryWrapper.eq(ActivityFeedback::getUserId,criteria.getUserId());
        Page<ActivityFeedback> ipage = activityFeedbackService.page(page,queryWrapper);
        for(ActivityFeedback activityFeedback : ipage.getRecords()){
            activityFeedback.setUser(userService.findById(activityFeedback.getUserId()));
            activityFeedback.setActivity(activityService.getById(activityFeedback.getActivityId()));
        }
        return new ResponseEntity<>(PageUtil.toPage(ipage.getRecords(), ipage.getTotal()), HttpStatus.OK);
    }

    @PostMapping
    @Log("新增活动反馈")
    @ApiOperation("新增活动反馈")
    public ResponseEntity<Object> createActivityFeedback(@Validated @RequestBody ActivityFeedback resources){
        resources.setUserId(SecurityUtils.getCurrentUserId().intValue());
        activityFeedbackService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改活动反馈")
    @ApiOperation("修改活动反馈")
    public ResponseEntity<Object> updateActivityFeedback(@Validated @RequestBody ActivityFeedback resources){
        activityFeedbackService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除活动反馈")
    @ApiOperation("删除活动反馈")
    public ResponseEntity<Object> deleteActivityFeedback(@RequestBody List<Integer> ids) {
        activityFeedbackService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}