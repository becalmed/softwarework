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
import me.zhengjie.modules.system.domain.ResourceRequirements;
import me.zhengjie.modules.system.service.ResourceRequirementsService;
import me.zhengjie.modules.system.domain.vo.ResourceRequirementsQueryCriteria;
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
* @author fjw
* @date 2024-06-13
**/
@RestController
@RequiredArgsConstructor
@Api(tags = "资源管理")
@RequestMapping("/api/resourceRequirements")
public class ResourceRequirementsController {

    private final ResourceRequirementsService resourceRequirementsService;

    @GetMapping
    @Log("查询资源")
    @ApiOperation("查询资源")
    @PreAuthorize("@el.check('resourceRequirements:list')")
    public ResponseEntity<PageResult<ResourceRequirements>> queryResourceRequirements(ResourceRequirementsQueryCriteria criteria, Page<Object> page){
        return new ResponseEntity<>(resourceRequirementsService.queryAll(criteria,page),HttpStatus.OK);
    }

    @PostMapping
    @Log("新增资源")
    @ApiOperation("新增资源")
    @PreAuthorize("@el.check('resourceRequirements:add')")
    public ResponseEntity<Object> createResourceRequirements(@Validated @RequestBody ResourceRequirements resources){
        resourceRequirementsService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改资源")
    @ApiOperation("修改资源")
    @PreAuthorize("@el.check('resourceRequirements:edit')")
    public ResponseEntity<Object> updateResourceRequirements(@Validated @RequestBody ResourceRequirements resources){
        resourceRequirementsService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除资源")
    @ApiOperation("删除资源")
    @PreAuthorize("@el.check('resourceRequirements:del')")
    public ResponseEntity<Object> deleteResourceRequirements(@RequestBody List<Integer> ids) {
        resourceRequirementsService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}