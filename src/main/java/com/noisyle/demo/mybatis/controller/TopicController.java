package com.noisyle.demo.mybatis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.noisyle.demo.mybatis.model.Topic;
import com.noisyle.demo.mybatis.repository.TopicRepository;

@RestController
@RequestMapping(value="/api")
public class TopicController {
    @Autowired
    private TopicRepository topicRepository;
    
    @RequestMapping(value="/topics", method=RequestMethod.GET)
    public Object findAll() {
        return topicRepository.findAll();
    }
    
    @RequestMapping(value="/topic/{id}", method=RequestMethod.GET)
    public Object findTopicById(@PathVariable Long id) {
        return topicRepository.findTopicById(id);
    }
    
    @RequestMapping(value="/topics/p{p:\\d+}", method=RequestMethod.GET)
    public Object queryFence(@PathVariable int p) {
        Page<Topic> page = PageHelper.startPage(p, 10);
        List<Topic> list = topicRepository.findTopicsByPage();
        
        Map<String, Object> data = new HashMap<>();
        data.put("total", page.getTotal());
        data.put("pageNo", p);
        data.put("data", list);
        
        return data;
    }
}
