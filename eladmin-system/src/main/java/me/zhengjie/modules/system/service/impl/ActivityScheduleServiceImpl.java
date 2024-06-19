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

import me.zhengjie.modules.system.domain.ActivitySchedule;
import me.zhengjie.utils.FileUtil;
import lombok.RequiredArgsConstructor;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.zhengjie.modules.system.service.ActivityScheduleService;
import me.zhengjie.modules.system.domain.vo.ActivityScheduleQueryCriteria;
import me.zhengjie.modules.system.mapper.ActivityScheduleMapper;
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
* @date 2024-06-19
**/
@Service
@RequiredArgsConstructor
public class ActivityScheduleServiceImpl extends ServiceImpl<ActivityScheduleMapper, ActivitySchedule> implements ActivityScheduleService {

    private final ActivityScheduleMapper activityScheduleMapper;

    @Override
    public PageResult<ActivitySchedule> queryAll(ActivityScheduleQueryCriteria criteria, Page<Object> page){
        return PageUtil.toPage(activityScheduleMapper.findAll(criteria, page));
    }

    @Override
    public List<ActivitySchedule> queryAll(ActivityScheduleQueryCriteria criteria){
        return activityScheduleMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(ActivitySchedule resources) {
        save(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(ActivitySchedule resources) {
        ActivitySchedule activitySchedule = getById(resources.getId());
        activitySchedule.copy(resources);
        saveOrUpdate(activitySchedule);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(List<Integer> ids) {
        removeBatchByIds(ids);
    }

    @Override
    public void download(List<ActivitySchedule> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (ActivitySchedule activitySchedule : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("活动名称", activitySchedule.getAid());
            map.put("活动日程名称", activitySchedule.getTitle());
            map.put("创建时间", activitySchedule.getCreateTime());
            map.put("开始时间", activitySchedule.getStartTime());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }
}