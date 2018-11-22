package com.honeywen.credit.model;

import com.honeywen.credit.base.BaseModel;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author wangwei
 * @date 2018/11/22 上午8:18
 */
public @Data class SysUser extends BaseModel {

    private Integer id;
    private String loginName;
    private String password;
    private String name;
    private String email;
    private String phone;
    private Integer status;
    private String wxOpenId;
    private String wxUnionId;
    private String remark;
}
