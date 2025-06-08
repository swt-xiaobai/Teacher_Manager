package com.sss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @RequestMapping(value="/save")
    public String save(){

        System.out.println("running");

        //用于界面跳转
        return "WEB-INF/page/success.jsp";
    }
}
