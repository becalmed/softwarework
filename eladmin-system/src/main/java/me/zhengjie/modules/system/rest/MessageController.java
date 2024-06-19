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
import me.zhengjie.modules.system.domain.Message;
import me.zhengjie.modules.system.service.MessageService;
import me.zhengjie.modules.system.domain.vo.MessageQueryCriteria;
import lombok.RequiredArgsConstructor;
import java.util.List;

import me.zhengjie.modules.system.service.UserService;
import me.zhengjie.utils.PageUtil;
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
@Api(tags = "消息管理")
@RequestMapping("/api/message")
public class MessageController {

    private final MessageService messageService;
    private final UserService userService;

    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    public void exportMessage(HttpServletResponse response, MessageQueryCriteria criteria) throws IOException {
        messageService.download(messageService.queryAll(criteria), response);
    }

    @GetMapping
    @Log("查询消息")
    @ApiOperation("查询消息")
    public ResponseEntity<PageResult<Message>> queryMessage(MessageQueryCriteria criteria, Page page){
        LambdaQueryWrapper<Message> queryWrapper = new LambdaQueryWrapper<>();
        if(criteria.getUid()!=null)
            queryWrapper.eq(Message::getUid,criteria.getUid());
        if(criteria.getCreateUser()!=null)
            queryWrapper.eq(Message::getCreateUser,criteria.getCreateUser());

        Page<Message> ipage = messageService.page(page,queryWrapper);
        for(Message message : ipage.getRecords()){
            message.setUser(userService.findById(message.getUid()));
            message.setCuser(userService.findById(message.getCreateUser()));
        }
        return new ResponseEntity<>(PageUtil.toPage(ipage.getRecords(), ipage.getTotal()), HttpStatus.OK);
    }

    @PostMapping
    @Log("新增消息")
    @ApiOperation("新增消息")
    public ResponseEntity<Object> createMessage(@Validated @RequestBody Message resources){
        messageService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改消息")
    @ApiOperation("修改消息")
    public ResponseEntity<Object> updateMessage(@Validated @RequestBody Message resources){
        messageService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除消息")
    @ApiOperation("删除消息")
    public ResponseEntity<Object> deleteMessage(@RequestBody List<Integer> ids) {
        messageService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}