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
package me.zhengjie.modules.system.service.impl;

import me.zhengjie.modules.system.domain.ResourceRequirements;
import me.zhengjie.utils.FileUtil;
import lombok.RequiredArgsConstructor;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.zhengjie.modules.system.service.ResourceRequirementsService;
import me.zhengjie.modules.system.domain.vo.ResourceRequirementsQueryCriteria;
import me.zhengjie.modules.system.mapper.ResourceRequirementsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import me.zhengjie.utils.PageUtil;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import me.zhengjie.utils.PageResult;

/**
* @description 服务实现
* @author fjw
* @date 2024-06-13
**/
@Service
@RequiredArgsConstructor
public class ResourceRequirementsServiceImpl extends ServiceImpl<ResourceRequirementsMapper, ResourceRequirements> implements ResourceRequirementsService {

    private final ResourceRequirementsMapper resourceRequirementsMapper;

    @Override
    public PageResult<ResourceRequirements> queryAll(ResourceRequirementsQueryCriteria criteria, Page<Object> page){
        return PageUtil.toPage(resourceRequirementsMapper.findAll(criteria, page));
    }

    @Override
    public List<ResourceRequirements> queryAll(ResourceRequirementsQueryCriteria criteria){
        return resourceRequirementsMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(ResourceRequirements resources) {
        save(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(ResourceRequirements resources) {
        ResourceRequirements resourceRequirements = getById(resources.getId());
        resourceRequirements.copy(resources);
        saveOrUpdate(resourceRequirements);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(List<Integer> ids) {
        removeBatchByIds(ids);
    }


}