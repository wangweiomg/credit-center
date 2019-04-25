package com.honeywen.credit.modules.wx.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微信公众号
 * @author wangwei
 * @date 2019/4/25
 */
@Slf4j
@RestController
@RequestMapping("/wx")
public class WxMpController {


    @GetMapping("/validateToken/")
    public String validateToken(String signature, String timestamp, String nonce, String echostr) {

        log.debug("<--微信token验证-->");


        return echostr;

    }

}
