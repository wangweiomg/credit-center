package com.honeywen.credit.base;

import lombok.Data;

import java.util.Date;

/**
 * @author weiw@opera.com
 * @date 2018/9/27 下午8:16
 */
public @Data class BaseModel {

    protected Integer id;
    protected String remark;
    protected Date createAt;
    protected Integer createBy;
    protected Date updateAt;
    protected Integer updateBy;
    protected Integer deleteFlag;

    public enum DeleteFlagEnum {
        /**
         * 1. 正常 0 删除
         */
        NORMAL(1),
        DELETED(2);

        private int value;
        DeleteFlagEnum(int value) {
            this.value = value;
        }
        public int getValue() {
            return value;
        }
    }
}
