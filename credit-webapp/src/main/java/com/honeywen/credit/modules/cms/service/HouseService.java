package com.honeywen.credit.modules.cms.service;

import com.honeywen.credit.modules.cms.entity.Fee;
import com.honeywen.credit.modules.cms.entity.House;

/**
 * @author wangwei
 * @date 2019/10/22
 */
public interface HouseService {


    /**
     * 计算各种收费
     * @param house
     * @return
     */
    Fee calcFees(House house);
}
