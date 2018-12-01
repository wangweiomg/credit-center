package com.honeywen.credit.modules.cms.repository.command;

import com.honeywen.credit.modules.cms.entity.Card;

import java.util.List;

/**
 * Created by wangwei on 2017/9/2.
 */
public interface CardCommandMapper {
    void save(Card card);

    void removeById(Integer id);

    void update(Card card);

    void saveList(List<Card> list);
}
