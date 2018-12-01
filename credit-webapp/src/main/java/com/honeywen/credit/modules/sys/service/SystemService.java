package com.honeywen.credit.modules.sys.service;

import com.honeywen.credit.common.security.shiro.session.SessionDAO;

/**
 * @author wangwei
 * @date 2018/12/1 下午6:09
 */
public interface SystemService {

    /**
     * 获取session
     * @return
     */
    SessionDAO getSessionDao();

}
