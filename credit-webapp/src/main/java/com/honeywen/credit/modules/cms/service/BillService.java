package com.honeywen.credit.modules.cms.service;

import com.honeywen.credit.modules.cms.entity.Bill;

import java.util.List;

/**
 * 账单服务接口
 * @author wangwei
 * @date 2020/7/7
 */
public interface BillService {

    /**
     * 生成个人账单
     * @param userId
     * @return
     */
    List<Bill> findAll(Integer userId);



}
