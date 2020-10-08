package com.honeywen.credit.modules.cms.service.impl;

import com.honeywen.credit.modules.cms.dao.RepaymentDao;
import com.honeywen.credit.modules.cms.entity.Repayment;
import com.honeywen.credit.modules.cms.service.RepaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author wangwei
 * @date 2020/9/9
 */
@Service
public class RepaymentServiceImpl implements RepaymentService {

    @Autowired
    private RepaymentDao repaymentDao;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(Repayment repayment) {

        repaymentDao.save(repayment);

    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void clearCard(Integer cardId) {

        Repayment param = new Repayment();
        param.setCardId(cardId);
        repaymentDao.save(param);

    }
}
