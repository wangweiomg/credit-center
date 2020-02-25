package com.honeywen.credit.modules.cms.entity;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author wangwei
 * @date 2019/10/22
 */
public @Data class House {

    /**
     * 城市
     */
    private String city;
    /**
     * 房龄
     */
    private Integer age;
    /**
     * 挂牌价
     */
    private BigDecimal price;
    /**
     * 上次交易价格
     */
    private BigDecimal lastTradePrice;
    /**
     * 建筑面积
     */
    private Double floorArea;

    /**
     * 实际使用面积
     */
    private Double usedArea;
    /**
     * 位置
     */
    private String location;
    /**
     * 容积率
     */
    private Double floorAreaRatio;


}
