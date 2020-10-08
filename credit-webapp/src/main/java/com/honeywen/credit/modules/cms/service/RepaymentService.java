package com.honeywen.credit.modules.cms.service;

import com.honeywen.credit.modules.cms.entity.Repayment;

/**
 * @author wangwei
 * @date 2020/9/9
 */
public interface RepaymentService {

    void save(Repayment repayment);

    /**
     * 结清卡片本期账单
     * @param cardId 卡片id
     */
    void clearCard(Integer cardId);
}
