package com.honeywen.credit.modules.cms.service;

import com.github.pagehelper.Page;
import com.honeywen.credit.modules.cms.dto.EventDTO;
import com.honeywen.credit.modules.cms.entity.Card;

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

    void removeByIds(String ids);
}
