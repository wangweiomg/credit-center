package com.honeywen.credit.modules.cms.service.impl;

import com.honeywen.credit.modules.cms.entity.Bill;
import com.honeywen.credit.modules.cms.entity.Card;
import com.honeywen.credit.modules.cms.service.BillService;
import com.honeywen.credit.modules.cms.service.CardService;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author wangwei
 * @date 2020/7/7
 */
@Service
public class BillServiceImpl implements BillService {

    @Autowired
    private CardService cardService;

    @Override
    public List<Bill> findAll(Integer userId) {


        List<Card> cards = cardService.findByUserId(userId);
        cards.stream().map(i -> {
            val t = new Bill();
            // Todo
            // 查询信用卡，当前处于什么阶段， 待还款、已还款

            //
            // t.setStartDate();
            // t.setLastDate();

            return t;


        }).collect(Collectors.toList());




        return null;
    }
}
