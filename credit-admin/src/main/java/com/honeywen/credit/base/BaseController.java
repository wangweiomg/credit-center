package com.honeywen.credit.base;

import com.honeywen.credit.constants.CommonConstant;
import com.honeywen.credit.model.User;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wangwei on 2017/9/9.
 */
public class BaseController {

    protected static final String ERROR_MSG_KEY = "errorMsg";



    protected ModelAndView toView(String viewName) {
        return new ModelAndView(viewName);
    }

    // 1. 获取保存在session中的用户对象
    protected User getSessionUser(HttpServletRequest request) {
        return (User) request.getSession().getAttribute(CommonConstant.USER_CONTEXT);
    }



}
