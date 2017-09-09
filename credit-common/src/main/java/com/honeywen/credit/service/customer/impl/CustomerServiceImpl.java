package com.honeywen.credit.service.customer.impl;

import com.honeywen.credit.model.customer.Customer;
import com.honeywen.credit.repository.customer.query.CustomerQueryMapper;
import com.honeywen.credit.service.customer.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by wangwei on 2017/9/8.
 */
@Service
@Transactional(readOnly = true)
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerQueryMapper customerQueryMapper;

    @Override
    public List<Customer> findAll() {
        return customerQueryMapper.findAll();
    }
}
