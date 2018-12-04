package com.honeywen.credit.modules.cms.dao;

import com.honeywen.credit.common.annotation.MyBatisDao;
import com.honeywen.credit.modules.cms.entity.Card;

/**
 * 批量处理
 * @author wangwei
 * @date 2018/11/25 下午7:44
 */
@MyBatisDao
public interface BatchDao {

    void deleteCardById(Card card);
}
