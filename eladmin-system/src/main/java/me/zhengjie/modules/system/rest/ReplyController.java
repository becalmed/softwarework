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
import me.zhengjie.modules.system.domain.ActivityFeedback;
import me.zhengjie.modules.system.domain.Reply;
import me.zhengjie.modules.system.service.ReplyService;
import me.zhengjie.modules.system.domain.vo.ReplyQueryCriteria;
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
@Api(tags = "讨论回复管理")
@RequestMapping("/api/reply")
public class ReplyController {

    private final ReplyService replyService;
    private final SysActivityService activityService;

    private final UserService userService;

    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    public void exportReply(HttpServletResponse response, ReplyQueryCriteria criteria) throws IOException {
        replyService.download(replyService.queryAll(criteria), response);
    }

    @GetMapping
    @Log("查询讨论回复")
    @ApiOperation("查询讨论回复")
    public ResponseEntity<PageResult<Reply>> queryReply(ReplyQueryCriteria criteria, Page page){
        LambdaQueryWrapper<Reply> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Reply::getDid,criteria.getActivityId());
        if(criteria.getUserId()!=null)
            queryWrapper.eq(Reply::getUserId,criteria.getUserId());

        Page<Reply> ipage = replyService.page(page,queryWrapper);
        for(Reply reply : ipage.getRecords()){
            reply.setUser(userService.findById(reply.getUserId()));
            reply.setActivity(activityService.getById(reply.getDid()));
        }
        return new ResponseEntity<>(PageUtil.toPage(ipage.getRecords(), ipage.getTotal()), HttpStatus.OK);
    }

    @PostMapping
    @Log("新增讨论回复")
    @ApiOperation("新增讨论回复")
    public ResponseEntity<Object> createReply(@Validated @RequestBody Reply resources){
        resources.setUserId(SecurityUtils.getCurrentUserId().intValue());
        replyService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改讨论回复")
    @ApiOperation("修改讨论回复")
    public ResponseEntity<Object> updateReply(@Validated @RequestBody Reply resources){
        replyService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除讨论回复")
    @ApiOperation("删除讨论回复")
    public ResponseEntity<Object> deleteReply(@RequestBody List<Integer> ids) {
        replyService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}