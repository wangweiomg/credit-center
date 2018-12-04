package com.honeywen.credit.modules.sys.dao;

import com.honeywen.credit.common.annotation.MyBatisDao;
import com.honeywen.credit.modules.sys.entity.SysDict;
import com.honeywen.credit.modules.sys.entity.SysRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wangwei
 * @date 2018/12/2 下午3:16
 */
@MyBatisDao
public interface SysDictDao {


    /**
     * 查询所有dict
     * @return
     */
    List<SysDict> findAll();
}
