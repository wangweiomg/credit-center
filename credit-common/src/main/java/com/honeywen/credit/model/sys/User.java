package com.honeywen.credit.model.sys;

import com.honeywen.credit.model.base.BaseModel;
import lombok.Data;

/**
 * Created by wangwei on 2017/9/9.
 */
public @Data class User extends BaseModel {

    private String name;
    private String email;
    private String password;
    private Integer age;
    private Integer gender;


}
