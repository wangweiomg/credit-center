package com.honeywen.credit.model.customer;

import com.honeywen.credit.model.base.BaseModel;
import lombok.Data;

/**
 * Created by wangwei on 2017/9/2.
 */
public @Data class Customer extends BaseModel {

    private String name;
    private String telephone;

    public static void main(String[] args) {
        Customer customer = new Customer();


    }
}
