package com.honeywen.credit.modules.sys.dao;

import com.honeywen.credit.common.annotation.MyBatisDao;
import com.honeywen.credit.modules.sys.entity.SysUser;
import org.apache.ibatis.annotations.Param;

/**
 * @author wangwei
 * @date 2018/12/2 下午3:16
 */
@MyBatisDao
public interface SysUserDao {
    /**
     * 通过登录名获取用户信息
     * @param loginName
     * @return
     */
    SysUser findByLoginName(@Param("loginName") String loginName);

    /**
     * 通过id找用户
     * @param id
     * @return
     */
    SysUser findById(@Param("id") Integer id);

    /**
     * 保存用户
     * @param user
     */
    void save(SysUser user);

    SysUser findByOpenId(@Param("openId") String openId);

    void update(SysUser user);
}
