package com.honeywen.credit.service.impl;

import com.honeywen.credit.model.card.Card;
import com.honeywen.credit.repository.card.query.CardQueryMapper;
import com.honeywen.credit.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by wangwei on 2017/9/10.
 */
@Service
@Transactional(readOnly = true)
public class CardServiceImpl implements CardService {


    @Autowired
    private CardQueryMapper cardQueryMapper;

    @Override
    public List<Card> findAll() {
        return cardQueryMapper.findAll();
    }
}
