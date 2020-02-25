package com.honeywen.credit.modules.cms.entity;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 房款、税款、服务费
 * @author wangwei
 * @date 2019/10/22
 */
public @Data class Fee {

    /**
     * 0 全款， 1贷款
     */
    private Integer payType;
//    private String





    private BigDecimal valueAddedTax;
    private BigDecimal personalIncomeTax;
    private BigDecimal deedTax;






}
