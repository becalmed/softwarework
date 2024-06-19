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

import me.zhengjie.modules.system.domain.Discuss;
import me.zhengjie.utils.FileUtil;
import lombok.RequiredArgsConstructor;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.zhengjie.modules.system.service.DiscussService;
import me.zhengjie.modules.system.domain.vo.DiscussQueryCriteria;
import me.zhengjie.modules.system.mapper.DiscussMapper;
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
* 
* @date 2024-06-13
**/
@Service
@RequiredArgsConstructor
public class DiscussServiceImpl extends ServiceImpl<DiscussMapper, Discuss> implements DiscussService {

    private final DiscussMapper discussMapper;

    @Override
    public PageResult<Discuss> queryAll(DiscussQueryCriteria criteria, Page<Object> page){
        return PageUtil.toPage(discussMapper.findAll(criteria, page));
    }

    @Override
    public List<Discuss> queryAll(DiscussQueryCriteria criteria){
        return discussMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(Discuss resources) {
        save(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(Discuss resources) {
        Discuss discuss = getById(resources.getId());
        discuss.copy(resources);
        saveOrUpdate(discuss);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(List<Integer> ids) {
        removeBatchByIds(ids);
    }

    @Override
    public void download(List<Discuss> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (Discuss discuss : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("用户id", discuss.getUserId());
            map.put("创建时间", discuss.getCreateTime());
            map.put("讨论标题", discuss.getTitle());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }
}