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

import me.zhengjie.modules.system.domain.ActivityUser;
import me.zhengjie.utils.FileUtil;
import lombok.RequiredArgsConstructor;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.zhengjie.modules.system.service.ActivityUserService;
import me.zhengjie.modules.system.domain.vo.ActivityUserQueryCriteria;
import me.zhengjie.modules.system.mapper.ActivityUserMapper;
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
public class ActivityUserServiceImpl extends ServiceImpl<ActivityUserMapper, ActivityUser> implements ActivityUserService {

    private final ActivityUserMapper activityUserMapper;

    @Override
    public List<Map<String, Object>> charts(Integer aid) {
        return activityUserMapper.charts(aid);
    }

    @Override
    public PageResult<ActivityUser> queryAll(ActivityUserQueryCriteria criteria, Page<Object> page){
        return PageUtil.toPage(activityUserMapper.findAll(criteria, page));
    }

    @Override
    public List<ActivityUser> queryAll(ActivityUserQueryCriteria criteria){
        return activityUserMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(ActivityUser resources) {
        save(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(ActivityUser resources) {
        ActivityUser activityUser = getById(resources.getId());
        activityUser.copy(resources);
        saveOrUpdate(activityUser);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(List<Integer> ids) {
        removeBatchByIds(ids);
    }

    @Override
    public void download(List<ActivityUser> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (ActivityUser activityUser : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("活动id", activityUser.getActivityId());
            map.put("报名用户id", activityUser.getUserId());
            map.put("审核状态", activityUser.getStatus());
            map.put("报名时间", activityUser.getCreateTime());
            map.put("分类", activityUser.getClassify());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }
}