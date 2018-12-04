package com.honeywen.credit.modules.sys.web;

import com.honeywen.credit.common.security.shiro.session.SessionDAO;
import com.honeywen.credit.common.utils.SpringContextHolder;
import com.honeywen.credit.common.utils.StringUtils;
import com.honeywen.credit.common.web.BaseController;
import com.honeywen.credit.modules.sys.dao.SysUserDao;
import com.honeywen.credit.modules.sys.security.FormAuthenticationFilter;
import com.honeywen.credit.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.honeywen.credit.modules.sys.utils.UserUtils;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author wangwei
 * @date 2018/12/2 下午3:36
 */
@Controller
public class LoginController extends BaseController {

    @Autowired
    private SessionDAO sessionDAO;

    @GetMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) {

        SysUserDao userDao = SpringContextHolder.getBean(SysUserDao.class);
        Principal principal = UserUtils.getPrincipal();
        if (principal != null) {
            return "redirect:/";
        }
        return "login";
    }

    /**
     * 登录失败处理， 真正的登陆在filter里处理
     * @return
     */
    @PostMapping("/login")
    public String loginFail(HttpServletRequest request, HttpServletResponse response, Model model) {

        Principal principal = UserUtils.getPrincipal();
        // 如果已经登录，则跳转到管理首页
        if(principal != null){
            return "redirect:" + adminPath;
        }

        String username = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
        boolean rememberMe = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM);
        boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
        String exception = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        String message = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);

        if (StringUtils.isBlank(message) || StringUtils.equals(message, "null")){
            message = "用户或密码错误, 请重试.";
        }

        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_MOBILE_PARAM, mobile);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);

        if (logger.isDebugEnabled()){
            logger.debug("login fail, active session size: {}, message: {}, exception: {}",
                    sessionDAO.getActiveSessions(false).size(), message, exception);
        }

        // 非授权异常，登录失败，验证码加1。
//        if (!UnauthorizedException.class.getName().equals(exception)){
//            model.addAttribute("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
//        }

        // 验证失败清空验证码
//        request.getSession().setAttribute(ValidateCodeServlet.VALIDATE_CODE, IdGen.uuid());

        // 如果是手机登录，则返回JSON字符串
        if (mobile){
            return renderString(response, model);
        }

        return "login";


    }

    /**
     * 登录成功，进入管理首页
     */
//    @RequiresPermissions("user")
    @RequestMapping(value = "")
    public String index(HttpServletRequest request, HttpServletResponse response) {
        Principal principal = UserUtils.getPrincipal();

        // 登录成功后，验证码计算器清零
//        isValidateCodeLogin(principal.getLoginName(), false, true);

        if (logger.isDebugEnabled()){
            logger.debug("show index, active session size: {}", sessionDAO.getActiveSessions(false).size());
        }

        // 如果已登录，再次访问主页，则退出原账号。
//        if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
//            String logined = CookieUtils.getCookie(request, "LOGINED");
//            if (StringUtils.isBlank(logined) || "false".equals(logined)){
//                CookieUtils.setCookie(response, "LOGINED", "true");
//            }else if (StringUtils.equals(logined, "true")){
//                UserUtils.getSubject().logout();
//                return "redirect:" + adminPath + "/login";
//            }
//        }

        // 如果是手机登录，则返回JSON字符串
        if (principal.isMobileLogin()){
            if (request.getParameter("login") != null){
                return renderString(response, principal);
            }
            if (request.getParameter("index") != null){
                return "index";
            }
            return "redirect:" + adminPath + "/login";
        }

//		// 登录成功后，获取上次登录的当前站点ID
//		UserUtils.putCache("siteId", StringUtils.toLong(CookieUtils.getCookie(request, "siteId")));

//		System.out.println("==========================a");
//		try {
//			byte[] bytes = com.thinkgem.jeesite.common.utils.FileUtils.readFileToByteArray(
//					com.thinkgem.jeesite.common.utils.FileUtils.getFile("c:\\sxt.dmp"));
//			UserUtils.getSession().setAttribute("kkk", bytes);
//			UserUtils.getSession().setAttribute("kkk2", bytes);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
////		for (int i=0; i<1000000; i++){
////			//UserUtils.getSession().setAttribute("a", "a");
////			request.getSession().setAttribute("aaa", "aa");
////		}
//		System.out.println("==========================b");
        return "index";
    }

}

