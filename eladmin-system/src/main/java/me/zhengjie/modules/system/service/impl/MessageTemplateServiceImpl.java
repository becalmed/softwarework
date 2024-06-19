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

import me.zhengjie.modules.system.domain.MessageTemplate;
import me.zhengjie.utils.FileUtil;
import lombok.RequiredArgsConstructor;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.zhengjie.modules.system.service.MessageTemplateService;
import me.zhengjie.modules.system.domain.vo.MessageTemplateQueryCriteria;
import me.zhengjie.modules.system.mapper.MessageTemplateMapper;
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
public class MessageTemplateServiceImpl extends ServiceImpl<MessageTemplateMapper, MessageTemplate> implements MessageTemplateService {

    private final MessageTemplateMapper messageTemplateMapper;

    @Override
    public PageResult<MessageTemplate> queryAll(MessageTemplateQueryCriteria criteria, Page<Object> page){
        return PageUtil.toPage(messageTemplateMapper.findAll(criteria, page));
    }

    @Override
    public List<MessageTemplate> queryAll(MessageTemplateQueryCriteria criteria){
        return messageTemplateMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(MessageTemplate resources) {
        save(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(MessageTemplate resources) {
        MessageTemplate messageTemplate = getById(resources.getId());
        messageTemplate.copy(resources);
        saveOrUpdate(messageTemplate);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(List<Integer> ids) {
        removeBatchByIds(ids);
    }

    @Override
    public void download(List<MessageTemplate> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (MessageTemplate messageTemplate : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("模板标题", messageTemplate.getTitle());
            map.put("模板内容", messageTemplate.getContent());
            map.put("创建时间", messageTemplate.getCreateTime());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }
}