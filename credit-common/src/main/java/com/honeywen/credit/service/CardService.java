package com.honeywen.credit.service;

import com.github.pagehelper.Page;
import com.honeywen.credit.dto.EventDTO;
import com.honeywen.credit.model.Card;

import java.util.List;
import java.util.Map;

/**
 * Created by wangwei on 2017/9/10.
 */
public interface CardService {

    List<Card> findAll();

    Card save(Card card);

    void removeById(Integer id);

    List<EventDTO> showOverview();

    void update(Card card);

    Page<Card> findByTest();

    Map<String, Object> findByTest2();

    Map<String,Object> findByTest3();
}
