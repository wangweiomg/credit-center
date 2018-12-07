package com.honeywen.credit.modules.wx.web;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import cn.binarywang.wx.miniapp.bean.WxMaUserInfo;
import com.alibaba.fastjson.JSON;
import com.google.common.base.Strings;
import com.honeywen.credit.modules.wx.config.WxMaConfiguration;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微信小程序用户接口
 * @author wangwei
 * @date 2018/11/8 下午12:37
 */
@Slf4j
@RestController
@RequestMapping("/wx/user/{appid}")
public class WxMaUserController {

    @GetMapping("/login")
    public String login(@PathVariable String appid, String code) {
        if (Strings.isNullOrEmpty(code)) {
            return "empty jscode";

        }

        final WxMaService wxService = WxMaConfiguration.getMaServices().get(appid);
        if (wxService == null) {
            throw new IllegalArgumentException(String.format("未找到对应appid=[%d]的配置!", appid));
        }

        try {
            WxMaJscode2SessionResult session = wxService.getUserService().getSessionInfo(code);
            log.info("<--session:  sessionKey-->{}, openid-->{}, unionid-->{}", session.getSessionKey(), session.getOpenid(), session.getUnionid());

            // 保存到数据库
            String openId = session.getOpenid();
            // unionid 可能为空，需要 getUserInfo 获取
            String unionId = session.getUnionid();


            return JSON.toJSONString(session);
        } catch (WxErrorException e) {
            log.error(e.getMessage(), e);
            return e.toString();
        }

    }


    @GetMapping("/info")
    public String info(@PathVariable String appid, String sessionKey, String signature,
                       String rawData, String encryptedData, String iv) {
        final WxMaService wxService = WxMaConfiguration.getMaServices().get(appid);
        if (wxService == null) {
            throw new IllegalArgumentException(String.format("未找到对应appid=[%d]的配置!", appid));
        }

        // 用户信息校验
        if (!wxService.getUserService().checkUserInfo(sessionKey, rawData, signature)) {
            return "user check failed";
        }

        // 解密用户信息
        WxMaUserInfo userInfo = wxService.getUserService().getUserInfo(sessionKey, encryptedData, iv);

        return JSON.toJSONString(userInfo);
    }


    public String phone(@PathVariable String appid, String sessionKey, String signature,
                        String rawData, String encryptedData, String iv) {
        final WxMaService wxService = WxMaConfiguration.getMaServices().get(appid);
        if (wxService == null) {
            throw new IllegalArgumentException(String.format("未找到对应appid=[%d]的配置!", appid));
        }

        // 用户信息校验
        if (!wxService.getUserService().checkUserInfo(sessionKey, rawData, signature)) {
            return "user check failed";
        }

        WxMaPhoneNumberInfo phoneNumberInfo = wxService.getUserService().getPhoneNoInfo(sessionKey, encryptedData, iv);

        return JSON.toJSONString(phoneNumberInfo);

    }


}
