package com.noisyle.demo.mybatis.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import com.noisyle.demo.mybatis.message.Greeting;
import com.noisyle.demo.mybatis.model.User;

@Controller
public class WebSocketController {
    
    @MessageMapping("/login")
    @SendTo("/message/greetings")
    public Greeting greeting(User user) throws Exception {
        Thread.sleep(1000); // simulated delay
        return new Greeting("你好, " + HtmlUtils.htmlEscape(user.getUsername()) + "!");
    }
    
}
