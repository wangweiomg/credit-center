package com.honeywen.credit.controller.customer.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangwei on 2017/9/2.
 */
@Controller
@RequestMapping("/customers")
public class CustomerController {

    public String findAll() {

        return "hello";
    }
}
