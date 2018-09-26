package com.honeywen.credit.service.impl;

import com.honeywen.credit.model.Card;
import com.honeywen.credit.repository.command.CardCommandMapper;
import com.honeywen.credit.repository.query.CardQueryMapper;
import com.honeywen.credit.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by wangwei on 2017/9/10.
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class CardServiceImpl implements CardService {


    @Autowired
    private CardQueryMapper cardQueryMapper;
    @Autowired
    private CardCommandMapper cardCommandMapper;

    @Override
    public List<Card> findAll() {
        return cardQueryMapper.findAll();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Card save(Card card) {
        return cardCommandMapper.save(card);
    }
}
