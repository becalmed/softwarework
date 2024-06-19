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

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import me.zhengjie.modules.system.domain.Reply;
import me.zhengjie.modules.system.domain.SysActivity;
import me.zhengjie.modules.system.service.DiscussService;
import me.zhengjie.modules.system.service.ResourceRequirementsService;
import me.zhengjie.modules.system.service.UserService;
import me.zhengjie.utils.FileUtil;
import lombok.RequiredArgsConstructor;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.zhengjie.modules.system.service.ReplyService;
import me.zhengjie.modules.system.domain.vo.ReplyQueryCriteria;
import me.zhengjie.modules.system.mapper.ReplyMapper;
import me.zhengjie.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
public class ReplyServiceImpl extends ServiceImpl<ReplyMapper, Reply> implements ReplyService {

    private final ReplyMapper replyMapper;
    @Autowired
    private ResourceRequirementsService resourceRequirementsService;
    @Autowired
    private UserService userService;


    @Override
    public PageResult<Reply> queryAll(ReplyQueryCriteria criteria, Page<Object> page) {
        return null;
    }

    @Override
    public List<Reply> queryAll(ReplyQueryCriteria criteria){
        return replyMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(Reply resources) {
        save(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(Reply resources) {
        Reply reply = getById(resources.getId());
        reply.copy(resources);
        saveOrUpdate(reply);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(List<Integer> ids) {
        removeBatchByIds(ids);
    }

    @Override
    public void download(List<Reply> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (Reply reply : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("讨论表id", reply.getDid());
            map.put("回复内容", reply.getContent());
            map.put("回复时间", reply.getCreateTime());
            map.put("回复用户", reply.getUserId());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }
}