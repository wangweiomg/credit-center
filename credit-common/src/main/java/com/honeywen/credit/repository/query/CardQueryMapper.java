package com.honeywen.credit.repository.query;

import com.honeywen.credit.model.Card;

import java.util.List;

/**
 * Created by wangwei on 2017/9/2.
 */
public interface CardQueryMapper {


    List<Card> findAll();
}
