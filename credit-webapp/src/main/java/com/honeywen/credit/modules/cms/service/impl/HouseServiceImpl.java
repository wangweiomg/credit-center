package com.honeywen.credit.modules.cms.service.impl;

import com.honeywen.credit.modules.cms.entity.Fee;
import com.honeywen.credit.modules.cms.entity.House;
import com.honeywen.credit.modules.cms.service.HouseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

/**
 * @author wangwei
 * @date 2019/10/22
 */
@Slf4j
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class HouseServiceImpl implements HouseService {


    @Override
    public Fee calcFees(House house) {

        // 1. 计算税 2. 计算贷款方式
        // 1.1 判断普通、非普
        // 2.2 增值税、个人所得税、契税
        boolean isOrdinary = checkOrdinary(house);






        return null;
    }

    /**
     * 1. 容积率>=1.0
     * 2. 建面 <=140
     * 3. 单价不超最高限，或总价不超最高限，满足其一即可
     * 以上同时满足为普通住宅，否则为非普
     *
     *            单价      总价
     * 五环内      39600   468
     * 五环-六环    31680   374.4
     * 六环外      23760   280.8
     * @param house
     * @return
     */


    private boolean checkOrdinary(House house) {

        boolean lowRatio = house.getFloorAreaRatio() < 1.0;
        if (lowRatio) {
            return false;
        }


        boolean largeArea = house.getFloorArea() > 140;
        if (largeArea) {
            return false;
        }

        double priceOfPerMeter = house.getPrice().divide(new BigDecimal(house.getFloorArea())).doubleValue();



        return true;



    }
}
