package com.honeywen.credit.modules.sys.entity;

import com.honeywen.credit.base.BaseModel;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author wangwei
 * @date 2018/11/22 上午8:18
 */
public @Data class SysUser extends BaseModel implements Serializable {

    private Integer id;
    private String loginName;
    private String password;
    private String name;
    private String email;
    private String mobile;
    private Integer status;
    private String wxOpenId;
    private String wxUnionId;
    private String nickName;
    private String avatarUrl;
    private String gender;
    private String country;
    private String province;
    private String city;
    private String language;


    public boolean isAdmin() {
        return id != null && 1 == id;
    }

    public enum StatusEnum {
        /**
         * 1. 启用 2停用
         */
        ON(1), OFF(2)
        ;

        private int value;
        StatusEnum (int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }
}
