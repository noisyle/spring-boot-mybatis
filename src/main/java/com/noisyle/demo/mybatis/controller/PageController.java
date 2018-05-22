package com.noisyle.demo.mybatis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {
    
    @RequestMapping(value="/topic/{id}", method=RequestMethod.GET)
    public String topic(Model model, @PathVariable String id) {
        model.addAttribute("id", id);
        return "topic";
    }
    
}
