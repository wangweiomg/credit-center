package com.honeywen.credit.service.customer;

import com.honeywen.credit.model.customer.Customer;

import java.util.List;

/**
 * Created by wangwei on 2017/9/2.
 */
public interface CustomerService {

    List<Customer> findAll();
}
