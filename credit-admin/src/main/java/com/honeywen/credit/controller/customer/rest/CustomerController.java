package com.honeywen.credit.controller.customer.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wangwei on 2017/9/2.
 */
@Controller
@RequestMapping("/customers")
public class CustomerController {

    @RequestMapping(method = RequestMethod.GET)
    public String findAll() {
        return "modules/customer/customerList";
    }
}
