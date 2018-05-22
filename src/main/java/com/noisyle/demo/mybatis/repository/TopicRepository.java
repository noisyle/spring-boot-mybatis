package com.noisyle.demo.mybatis.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.noisyle.demo.mybatis.model.Topic;

@Mapper
public interface TopicRepository {
    @Select("select * from forum_topic")
    @ResultMap("Topic")
    public List<Topic> findAll();
    
    public Topic findTopicById(Long id);
    
    public List<Topic> findTopicsByPage();
}
