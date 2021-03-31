package com.honeywen.credit.modules.cms.service;

import com.honeywen.credit.modules.cms.dto.EventDTO;

import java.math.BigDecimal;
import java.util.List;

/**
 * 计划
 * @author weiw@opera.com
 * @date 2018/9/28 下午4:04
 */
public interface PlanService {

    /**
     * 生成刷卡计划
     */
    List<EventDTO> generatePlan();

    /**
     * 根据所需金额生成计划
     * @param needAmount
     * @return
     */
    List<EventDTO> generatePlan(int needAmount);


}
