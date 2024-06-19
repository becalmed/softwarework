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
import me.zhengjie.modules.system.domain.Discuss;
import me.zhengjie.modules.system.service.DiscussService;
import me.zhengjie.modules.system.domain.vo.DiscussQueryCriteria;
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
@Api(tags = "讨论管理")
@RequestMapping("/api/discuss")
public class DiscussController {

    private final DiscussService discussService;

    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    @PreAuthorize("@el.check('discuss:list')")
    public void exportDiscuss(HttpServletResponse response, DiscussQueryCriteria criteria) throws IOException {
        discussService.download(discussService.queryAll(criteria), response);
    }

    @GetMapping
    @Log("查询讨论")
    @ApiOperation("查询讨论")
    @PreAuthorize("@el.check('discuss:list')")
    public ResponseEntity<PageResult<Discuss>> queryDiscuss(DiscussQueryCriteria criteria, Page<Object> page){
        return new ResponseEntity<>(discussService.queryAll(criteria,page),HttpStatus.OK);
    }

    @PostMapping
    @Log("新增讨论")
    @ApiOperation("新增讨论")
    @PreAuthorize("@el.check('discuss:add')")
    public ResponseEntity<Object> createDiscuss(@Validated @RequestBody Discuss resources){
        discussService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改讨论")
    @ApiOperation("修改讨论")
    @PreAuthorize("@el.check('discuss:edit')")
    public ResponseEntity<Object> updateDiscuss(@Validated @RequestBody Discuss resources){
        discussService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除讨论")
    @ApiOperation("删除讨论")
    @PreAuthorize("@el.check('discuss:del')")
    public ResponseEntity<Object> deleteDiscuss(@RequestBody List<Integer> ids) {
        discussService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}