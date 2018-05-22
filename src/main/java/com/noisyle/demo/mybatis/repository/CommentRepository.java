package com.noisyle.demo.mybatis.repository;

import org.apache.ibatis.annotations.Mapper;

import com.noisyle.demo.mybatis.model.Comment;

@Mapper
public interface CommentRepository {
    public void insert(Comment comment);
}
