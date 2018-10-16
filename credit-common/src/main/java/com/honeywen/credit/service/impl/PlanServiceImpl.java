package com.honeywen.credit.service.impl;

import com.honeywen.credit.dto.EventDTO;
import com.honeywen.credit.model.Card;
import com.honeywen.credit.repository.query.CardQueryMapper;
import com.honeywen.credit.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

        return cards.stream().map(card -> {

            return EventDTO.builder()
                    .title("刷" + card.getName())
                    .start(now.withDayOfMonth(card.getBillDay() + 1).toString())
                    .build();

        }).collect(Collectors.toList());


    }
}
