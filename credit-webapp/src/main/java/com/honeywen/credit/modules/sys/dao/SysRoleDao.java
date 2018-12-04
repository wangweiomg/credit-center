package com.honeywen.credit.modules.sys.dao;

import com.honeywen.credit.common.annotation.MyBatisDao;
import com.honeywen.credit.modules.sys.entity.SysRole;
import com.honeywen.credit.modules.sys.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wangwei
 * @date 2018/12/2 下午3:16
 */
@MyBatisDao
public interface SysRoleDao {

    /**
     * 查询所有的角色
     * @return
     */
    List<SysRole> findAll();

    /**
     * 查询用户所有角色
     * @param userId
     * @return
     */
    List<SysRole> findByUserId(@Param("userId") Integer userId);
}
