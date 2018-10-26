package com.honeywen.credit.service.impl;

import com.google.common.collect.Lists;
import com.honeywen.credit.dto.EventDTO;
import com.honeywen.credit.model.Card;
import com.honeywen.credit.repository.query.CardQueryMapper;
import com.honeywen.credit.service.PlanService;
import org.apache.poi.ss.formula.functions.Even;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author weiw@opera.com
 * @date 2018/9/28 下午4:04
 */
@Service
public class PlanServiceImpl implements PlanService {

    @Autowired
    private CardQueryMapper cardQueryMapper;


    @Override
    public List<EventDTO> generatePlan() {

        List<Card> cards = cardQueryMapper.findAll();

        final LocalDate now = LocalDate.now();

        List<EventDTO> list = Lists.newArrayList();

        //
        cards.forEach(i -> {

            // 哪一天，刷多少
            int billDay = i.getBillDay();
            EventDTO e1 = EventDTO.builder()
                    .start(now.withDayOfMonth(billDay + 1).toString())
                    .title("刷" + i.getName() + ", 金额：￥" + i.getCardLimit().divide(BigDecimal.valueOf(4L), BigDecimal.ROUND_FLOOR))
                    .build();
            EventDTO e2 = EventDTO.builder()
                    .start(now.withDayOfMonth(billDay + 2).toString())
                    .title("刷" + i.getName() + ", 金额：￥" + i.getCardLimit().divide(BigDecimal.valueOf(4L), BigDecimal.ROUND_FLOOR))
                    .build();
            EventDTO e3 = EventDTO.builder()
                    .start(now.withDayOfMonth(billDay + 3).toString())
                    .title("刷" + i.getName() + ", 金额：￥" + i.getCardLimit().divide(BigDecimal.valueOf(4L), BigDecimal.ROUND_FLOOR))
                    .build();
            list.add(e1);
            list.add(e2);
            list.add(e3);


        });

        return list;

    }
}
