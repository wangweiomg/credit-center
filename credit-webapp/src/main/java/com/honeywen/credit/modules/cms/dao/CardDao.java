package com.honeywen.credit.modules.cms.dao;

import com.honeywen.credit.common.annotation.MyBatisDao;
import com.honeywen.credit.modules.cms.entity.Card;

import java.util.List;

/**
 * Created by wangwei on 2017/9/2.
 */
@MyBatisDao
public interface CardDao {


    List<Card> findAll();

    List<Card> findList(Card card);


    void saveList(List<Card> list);

    void save(Card card);

    void removeById(Integer id);

    void update(Card card);
}
