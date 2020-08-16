package com.honeywen.credit.modules.cms.entity;

import com.honeywen.credit.base.BaseModel;
import com.honeywen.credit.modules.sys.entity.SysUser;
import lombok.Data;

import java.math.BigDecimal;


/**
 * Created by wangwei on 2017/9/10.
 */
public @Data class Card extends BaseModel {


    private Integer userId;
    /**
     * 卡片名称， 非空
     */
    private String name;

    /**
     * 卡号
     */
    private String cardNo;

    /**
     * 支付密码
     */
    private String password;

    /**
     * 所属银行ID,非空
     */
    private Integer bankId;
    /**
     * 卡片类型 1. 贷记卡 2.储蓄卡
     */
    private Integer cardType;
    /**
     * 卡片额度
     */
    private BigDecimal cardLimit;
    /**
     * 账单日
     */
    private Integer billDay;
    /**
     * 还款日类型 1.固定还款日 2.账单日后多少天
     */
    private Integer repayDayType;
    /**
     * 还款日记数
     * 如果是固定还款日，就是还款日
     * 如果是账单日后多少天， 就是多少天
     */
    private Integer repayDayNum;
    /**
     * 卡片状态 1，启用中
     */
    private Integer status;




    /**
     * params
     */


    /**
     * 批量添加数量
     */
    private Integer multipleNum;
    /**
     * 微信open id
     */
    private String wxOpenId;

    private SysUser user;


    public enum CardTypeEnum {

        /**
         * 1. 信用卡 2.储蓄卡
         */
        CREDIT_CARD(1),
        SAVING_CARD(2);

        private int value;

        CardTypeEnum(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }


    public enum RepayDayTypeEnum {

        /**
         * 1. 固定日期 2.顺延日期
         */
        FIXED_DAY(1),
        DELAY_DAY(2);

        private int value;
        RepayDayTypeEnum(int value) {
            this.value = value;
        }
        public int getValue() {
            return value;
        }
    }
    public enum StatusEnum {
        /**
         * 1. 启用中
         * 2. 停用
         */
        ON(1),
        OFF(2);

        private int value;

        StatusEnum(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }

    }


}
