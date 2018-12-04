package com.honeywen.credit.modules.cms.dao;

import com.honeywen.credit.common.annotation.MyBatisDao;
import com.honeywen.credit.modules.cms.entity.Card;

import java.util.List;
import java.util.Map;

/**
 * Created by wangwei on 2017/9/2.
 */
@MyBatisDao
public interface CardDao {


    List<Card> findAll();

    List<Card> findByTest(Map<String, Object> map);

    Map<String, Object> findByTest2(Map<String,Object> map);

    Map<String,Object> ç(Map<String,Object> map);

    Map<String,Object> findByTest3(Map<String,Object> map);

    void saveList(List<Card> list);

    void save(Card card);

    void removeById(Integer id);

    void update(Card card);
}
