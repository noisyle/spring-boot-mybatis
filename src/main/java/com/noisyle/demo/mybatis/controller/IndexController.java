package com.noisyle.demo.mybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.noisyle.demo.mybatis.repository.UserRepository;

@RestController
public class IndexController {
    @Autowired
    private UserRepository userRepository;
    
    @RequestMapping(value="/users", method=RequestMethod.GET)
    public Object findAll() {
        return userRepository.findAll();
    }
    
    @RequestMapping(value="/user/{id}", method=RequestMethod.GET)
    public Object findUserById(@PathVariable Long id) {
        return userRepository.findUserById(id);
    }
    
}
