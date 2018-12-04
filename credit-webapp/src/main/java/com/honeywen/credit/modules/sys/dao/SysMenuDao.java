package com.honeywen.credit.modules.sys.dao;

import com.honeywen.credit.common.annotation.MyBatisDao;
import com.honeywen.credit.modules.sys.entity.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wangwei
 * @date 2018/12/2 下午3:16
 */
@MyBatisDao
public interface SysMenuDao {

    /**
     * 查询所有菜单
     * @return
     */
    List<SysMenu> findAll();

    /**
     * 通过用户ID获取菜单
     * @param userId
     * @return
     */
    List<SysMenu> findByUserId(@Param("userId") Integer userId);
}
