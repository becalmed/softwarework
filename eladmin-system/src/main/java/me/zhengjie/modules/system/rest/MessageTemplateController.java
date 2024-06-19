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

import me.zhengjie.annotation.Log;
import me.zhengjie.modules.system.domain.MessageTemplate;
import me.zhengjie.modules.system.service.MessageTemplateService;
import me.zhengjie.modules.system.domain.vo.MessageTemplateQueryCriteria;
import lombok.RequiredArgsConstructor;
import java.util.List;
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
@Api(tags = "消息模板管理")
@RequestMapping("/api/messageTemplate")
public class MessageTemplateController {

    private final MessageTemplateService messageTemplateService;

    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    public void exportMessageTemplate(HttpServletResponse response, MessageTemplateQueryCriteria criteria) throws IOException {
        messageTemplateService.download(messageTemplateService.queryAll(criteria), response);
    }

    @GetMapping
    @Log("查询消息模板")
    @ApiOperation("查询消息模板")
    public ResponseEntity<PageResult<MessageTemplate>> queryMessageTemplate(MessageTemplateQueryCriteria criteria, Page<Object> page){
        return new ResponseEntity<>(messageTemplateService.queryAll(criteria,page),HttpStatus.OK);
    }

    @PostMapping
    @Log("新增消息模板")
    @ApiOperation("新增消息模板")
    public ResponseEntity<Object> createMessageTemplate(@Validated @RequestBody MessageTemplate resources){
        messageTemplateService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改消息模板")
    @ApiOperation("修改消息模板")
    public ResponseEntity<Object> updateMessageTemplate(@Validated @RequestBody MessageTemplate resources){
        messageTemplateService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除消息模板")
    @ApiOperation("删除消息模板")
    public ResponseEntity<Object> deleteMessageTemplate(@RequestBody List<Integer> ids) {
        messageTemplateService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}