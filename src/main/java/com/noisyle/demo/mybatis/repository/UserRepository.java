package com.noisyle.demo.mybatis.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.noisyle.demo.mybatis.model.User;

@Mapper
public interface UserRepository {
    @Select("select * from sys_user")
    @ResultMap("User")
    public List<User> findAll();
    
    public User findUserById(Long id);
    
    public User findUserByUsername(String username);
}
