package com.honeywen.credit.repository.card.query;

import com.honeywen.credit.model.card.Card;

import java.util.List;

/**
 * Created by wangwei on 2017/9/2.
 */
public interface CardQueryMapper {


    List<Card> findAll();
}
