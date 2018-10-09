package com.honeywen.credit.repository.command;

import com.honeywen.credit.model.Card;

/**
 * Created by wangwei on 2017/9/2.
 */
public interface CardCommandMapper {
    void save(Card card);

    void removeById(Integer id);

    void update(Card card);
}
