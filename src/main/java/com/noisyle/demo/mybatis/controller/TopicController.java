package com.noisyle.demo.mybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.noisyle.demo.mybatis.model.Comment;
import com.noisyle.demo.mybatis.model.Topic;
import com.noisyle.demo.mybatis.repository.CommentRepository;
import com.noisyle.demo.mybatis.repository.TopicRepository;

@RestController
@RequestMapping(value="/api")
public class TopicController {
    @Autowired
    private TopicRepository topicRepository;
    @Autowired
    private CommentRepository commentRepository;
    
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
        Page<Topic> page = PageHelper.startPage(p, 5);
        topicRepository.findTopicsByPage();
        return page.toPageInfo();
    }
    
    @RequestMapping(value="/topic/{id}/comment", method=RequestMethod.POST)
    public Object comment(@PathVariable Long id, @RequestParam String content) {
        Comment comment = new Comment();
        comment.setUserId(1l);
        comment.setTopicId(id);
        comment.setContent(content);
        commentRepository.insert(comment);
        return comment;
    }
}
