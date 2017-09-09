package com.honeywen.credit.controller.customer.rest;

import com.honeywen.credit.base.BaseController;
import com.honeywen.credit.model.customer.Customer;
import com.honeywen.credit.service.customer.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by wangwei on 2017/9/2.
 */
@Controller
@RequestMapping("/customers")
public class CustomerController extends BaseController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping(method = RequestMethod.GET)
    public String findAll(Model model) {

        List<Customer> customerList = customerService.findAll();
        model.addAttribute("customerList", customerList);
        return "modules/customer/customerList";
    }
}
