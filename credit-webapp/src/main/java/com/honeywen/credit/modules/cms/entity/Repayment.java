package com.honeywen.credit.modules.cms.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 还款记录
 * @author wangwei
 * @date 2020/9/2
 */
public @Data class Repayment {

    private Integer id;
    private Integer userId;
    private Integer cardId;
    private BigDecimal amount;

    private String remark;
    private Integer createBy;
    private Date createAt;
    private Integer updateBy;
    private Date updateAt;
    private Integer deleteFlag;
}
