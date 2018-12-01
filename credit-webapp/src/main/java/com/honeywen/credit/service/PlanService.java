package com.honeywen.credit.service;

import com.honeywen.credit.dto.EventDTO;

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



}
