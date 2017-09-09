package com.honeywen.credit.repository.customer.query;

import com.honeywen.credit.model.customer.Customer;

import java.util.List;

/**
 * Created by wangwei on 2017/9/2.
 */
public interface CustomerQueryMapper {

    List<Customer> findAll();

}
