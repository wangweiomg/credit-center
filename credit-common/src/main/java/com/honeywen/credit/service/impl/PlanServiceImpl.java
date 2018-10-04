package com.honeywen.credit.service.impl;

import com.honeywen.credit.model.Card;
import com.honeywen.credit.repository.query.CardQueryMapper;
import com.honeywen.credit.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author weiw@opera.com
 * @date 2018/9/28 下午4:04
 */
@Service
public class PlanServiceImpl implements PlanService {

    @Autowired
    private CardQueryMapper cardQueryMapper;


    @Override
    public void generatePlan() {

        List<Card> cards = cardQueryMapper.findAll();


    }
}
