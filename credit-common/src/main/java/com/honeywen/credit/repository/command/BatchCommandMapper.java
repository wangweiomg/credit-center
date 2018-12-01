package com.honeywen.credit.repository.command;

import com.honeywen.credit.model.Card;

/**
 * 批量处理
 * @author wangwei
 * @date 2018/11/25 下午7:44
 */
public interface BatchCommandMapper {

    void deleteCardById(Card card);
}
