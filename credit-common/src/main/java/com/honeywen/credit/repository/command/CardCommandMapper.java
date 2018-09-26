package com.honeywen.credit.repository.command;

import com.honeywen.credit.model.Card;

/**
 * Created by wangwei on 2017/9/2.
 */
public interface CardCommandMapper {
    Card save(Card card);
}
