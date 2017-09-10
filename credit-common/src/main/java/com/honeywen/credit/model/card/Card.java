package com.honeywen.credit.model.card;

import com.honeywen.credit.model.base.BaseModel;
import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by wangwei on 2017/9/10.
 */
public @Data class Card extends BaseModel {

    private String cardNo; // 卡号
    private String alias; // 别名
    private Integer bankId; //所属银行代码
    private String cardType; // 卡片类型 1. 贷记卡 2. 准贷记卡 3.借记卡
    private BigDecimal creditLimit; // 信用卡额度
    private Integer billDay; // 账单日, 每月X号
    private Integer fixedRepayDay; // 固定还款日， 为每月固定x号
    private Integer delayRepayDay; // 还款日， 账单日后 X 天
    private Integer status; // 状态 1. 启用 2.未开卡

}
