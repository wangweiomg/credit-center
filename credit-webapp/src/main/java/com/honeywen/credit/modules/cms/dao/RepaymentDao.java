package com.honeywen.credit.modules.cms.dao;

import com.honeywen.credit.common.annotation.MyBatisDao;
import com.honeywen.credit.modules.cms.entity.Repayment;

/**
 * Created by wangwei on 2017/9/2.
 */
@MyBatisDao
public interface RepaymentDao {


    void save(Repayment repayment);
}
