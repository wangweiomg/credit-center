package com.honeywen.credit.modules.sys.service.impl;

import com.honeywen.credit.common.security.shiro.session.SessionDAO;
import com.honeywen.credit.modules.sys.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 系统类
 * @author wangwei
 * @date 2018/12/1 下午6:11
 */
@Service
public class SystemServiceImpl implements SystemService {

    @Autowired
    private SessionDAO sessionDao;

    @Override
    public SessionDAO getSessionDao() {
        return sessionDao;
    }
}
