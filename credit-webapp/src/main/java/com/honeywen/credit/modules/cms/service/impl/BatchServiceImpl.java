package com.honeywen.credit.modules.cms.service.impl;

import com.honeywen.credit.modules.cms.entity.Card;
import com.honeywen.credit.modules.cms.dao.BatchDao;
import com.honeywen.credit.modules.cms.service.BatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author wangwei
 * @date 2018/11/25 下午7:04
 */
@Service
public class BatchServiceImpl implements BatchService {

    @Autowired
    private BatchDao batchCommandMapper;

    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
    @Override
    public void deleteCardById(String id) {

        Card card = new Card();
        card.setId(Integer.parseInt(id));
        card.setUpdateBy(1);

        batchCommandMapper.deleteCardById(card);

    }
}
