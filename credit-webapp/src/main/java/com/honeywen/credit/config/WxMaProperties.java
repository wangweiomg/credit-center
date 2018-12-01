package com.honeywen.credit.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 小程序配置
 * @author wangwei
 * @date 2018/11/7 上午9:36
 */
@Component
public @Data class WxMaProperties {


    /**
     * 小程序的appid
     */
    @Value("${wx.miniapp.config.appid}")
    private String appid;

    /**
     * 小程序的Secret
     */
    @Value("${wx.miniapp.config.secret}")
    private String secret;

    /**
     * 小程序消息服务器配置的token
     */
    @Value("${wx.miniapp.config.token}")
    private String token;

    /**
     * 小程序消息服务器的EncodingASEKey
     */
    @Value("${wx.miniapp.config.aesKey}")
    private String aesKey;

    /**
     * 消息格式，XML或者JSON
     */
    @Value("${wx.miniapp.config.msgDataFormat}")
    private String msgDataFormat;

}
