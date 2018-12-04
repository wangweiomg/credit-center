package com.honeywen.credit.modules.sys.service;

import com.honeywen.credit.common.security.shiro.session.SessionDAO;
import com.honeywen.credit.modules.sys.dao.SysUserDao;
import com.honeywen.credit.modules.sys.entity.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 系统类
 * @author wangwei
 * @date 2018/12/1 下午6:11
 */
@Service
public class SystemService {

    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;
    public static final int SALT_SIZE = 8;

    @Autowired
    private SessionDAO sessionDao;
    @Autowired
    private SysUserDao sysUserDao;

    public SessionDAO getSessionDao() {
        return sessionDao;
    }

    public SysUser getUserByLoginName(String loginName) {
        return sysUserDao.findByLoginName(loginName);
    }
}
