package com.honeywen.credit.modules.cms.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 消费账单实体
 * @author wangwei
 * @date 2020/8/26
 */
public @Data class Bill {

    private Integer id;
    private Integer userId;
    private Integer cardId;
    private BigDecimal amount;
    private String merchantType;
    private String remark;

    private Integer createBy;
    private Date createAt;
    private Integer updateBy;
    private Date updateAt;
    private Integer deleteFlag;
}
