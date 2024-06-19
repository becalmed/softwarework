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

import me.zhengjie.modules.system.domain.ActivityCost;
import me.zhengjie.utils.FileUtil;
import lombok.RequiredArgsConstructor;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.zhengjie.modules.system.service.ActivityCostService;
import me.zhengjie.modules.system.domain.vo.ActivityCostQueryCriteria;
import me.zhengjie.modules.system.mapper.ActivityCostMapper;
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
public class ActivityCostServiceImpl extends ServiceImpl<ActivityCostMapper, ActivityCost> implements ActivityCostService {

    private final ActivityCostMapper activityCostMapper;

    @Override
    public PageResult<ActivityCost> queryAll(ActivityCostQueryCriteria criteria, Page<Object> page){
        return PageUtil.toPage(activityCostMapper.findAll(criteria, page));
    }

    @Override
    public List<ActivityCost> queryAll(ActivityCostQueryCriteria criteria){
        return activityCostMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(ActivityCost resources) {
        save(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(ActivityCost resources) {
        ActivityCost activityCost = getById(resources.getId());
        activityCost.copy(resources);
        saveOrUpdate(activityCost);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(List<Integer> ids) {
        removeBatchByIds(ids);
    }

    @Override
    public void download(List<ActivityCost> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (ActivityCost activityCost : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("用户id", activityCost.getUserId());
            map.put("活动id", activityCost.getActivityId());
            map.put("金额", activityCost.getPrice());
            map.put("费用说明", activityCost.getContent());
            map.put("审核状态", activityCost.getStatus());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }
}