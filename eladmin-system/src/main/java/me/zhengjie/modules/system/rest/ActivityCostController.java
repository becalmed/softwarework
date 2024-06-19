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
import me.zhengjie.modules.system.domain.SysActivity;
import me.zhengjie.modules.system.service.ActivityCostService;
import me.zhengjie.modules.system.domain.vo.ActivityCostQueryCriteria;
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
@Api(tags = "活动费用管理")
@RequestMapping("/api/activityCost")
public class ActivityCostController {

    private final ActivityCostService activityCostService;

    private final SysActivityService activityService;

    private final UserService userService;

    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    public void exportActivityCost(HttpServletResponse response, ActivityCostQueryCriteria criteria) throws IOException {
        activityCostService.download(activityCostService.queryAll(criteria), response);
    }

    @GetMapping
    @Log("查询活动费用")
    @ApiOperation("查询活动费用")
    public ResponseEntity<PageResult<ActivityCost>> queryActivityCost(ActivityCostQueryCriteria criteria, Page page){
        LambdaQueryWrapper<ActivityCost> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ActivityCost::getActivityId,criteria.getActivityId());
        if(criteria.getUserId()!=null)
            queryWrapper.eq(ActivityCost::getUserId,criteria.getUserId());

        Page<ActivityCost> ipage = activityCostService.page(page,queryWrapper);
        for(ActivityCost activityCost : ipage.getRecords()){
            activityCost.setUser(userService.findById(activityCost.getUserId()));
            activityCost.setActivity(activityService.getById(activityCost.getActivityId()));
        }
        return new ResponseEntity<>(PageUtil.toPage(ipage.getRecords(), ipage.getTotal()), HttpStatus.OK);
    }

    @PostMapping
    @Log("新增活动费用")
    @ApiOperation("新增活动费用")
    public ResponseEntity<Object> createActivityCost(@Validated @RequestBody ActivityCost resources){
        resources.setUserId(SecurityUtils.getCurrentUserId().intValue());
        resources.setStatus("等待审批");
        activityCostService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改活动费用")
    @ApiOperation("修改活动费用")
    public ResponseEntity<Object> updateActivityCost(@Validated @RequestBody ActivityCost resources){
        activityCostService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除活动费用")
    @ApiOperation("删除活动费用")
    public ResponseEntity<Object> deleteActivityCost(@RequestBody List<Integer> ids) {
        activityCostService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}