package com.honeywen.credit.repository.query;

import com.honeywen.credit.model.Card;

import java.util.List;
import java.util.Map;

/**
 * Created by wangwei on 2017/9/2.
 */
public interface CardQueryMapper {


    List<Card> findAll();

    List<Card> findByTest(Map<String, Object> map);
}
