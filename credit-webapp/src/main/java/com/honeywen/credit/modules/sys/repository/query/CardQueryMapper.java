package com.honeywen.credit.modules.sys.repository.query;

import com.honeywen.credit.modules.cms.entity.Card;

import java.util.List;
import java.util.Map;

/**
 * Created by wangwei on 2017/9/2.
 */
public interface CardQueryMapper {


    List<Card> findAll();

    List<Card> findByTest(Map<String, Object> map);

    Map<String, Object> findByTest2(Map<String, Object> map);

    Map<String,Object> ç(Map<String, Object> map);

    Map<String,Object> findByTest3(Map<String, Object> map);
}
