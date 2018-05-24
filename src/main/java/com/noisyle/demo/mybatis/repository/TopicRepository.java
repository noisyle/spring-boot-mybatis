package com.noisyle.demo.mybatis.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.noisyle.demo.mybatis.model.Topic;

@Mapper
public interface TopicRepository {
    public Topic findTopicById(Long id);
    
    public List<Topic> findTopics();
}
