package com.honeywen.credit.config;

import lombok.Data;

/**
 * 小程序配置
 * @author wangwei
 * @date 2018/11/7 上午9:36
 */
public @Data class WxMaProperties {

    /**
     * 小程序的appid
     */
    private String appid;

    /**
     * 小程序的Secret
     */
    private String secret;

    /**
     * 小程序消息服务器配置的token
     */
    private String token;

    /**
     * 小程序消息服务器的EncodingASEKey
     */
    private String aesKey;

    /**
     * 消息格式，XML或者JSON
     */
    private String msgDataFormat;
}
