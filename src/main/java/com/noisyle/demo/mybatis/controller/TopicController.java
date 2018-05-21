package com.noisyle.demo.mybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
    
}
