package com.honeywen.credit.modules.wx.web;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaKefuMessage;
import cn.binarywang.wx.miniapp.bean.WxMaMessage;
import cn.binarywang.wx.miniapp.constant.WxMaConstants;
import com.alibaba.fastjson.JSON;
import com.honeywen.credit.modules.wx.config.WxMaConfiguration;
import com.honeywen.credit.modules.wx.dto.TulingRequest;
import com.honeywen.credit.modules.wx.dto.TulingResponse;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.*;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.Charset;
import java.util.*;

/**
 * @author wangwei
 * @date 2018/11/9 下午6:27
 */
@Slf4j
@RestController
@RequestMapping("/wx/portal/{appid}")
public class WxPortalController {


    public static final String TULING_URL = "http://openapi.tuling123.com/openapi/api/v2";


    @GetMapping(produces = "text/plain;charset=utf-8")
    public String authGet(@PathVariable String appid,
                          @RequestParam(name = "signature", required = false) String signature,
                          @RequestParam(name = "timestamp", required = false) String timestamp,
                          @RequestParam(name = "nonce", required = false) String nonce,
                          @RequestParam(name = "echostr", required = false) String echostr) {
        log.debug("\n接收到来自微信服务器的认证消息：signature = [{}], timestamp = [{}], nonce = [{}], echostr = [{}]",
                signature, timestamp, nonce, echostr);

        if (StringUtils.isAnyBlank(signature, timestamp, nonce, echostr)) {
            throw new IllegalArgumentException("请求参数非法，请核实!");
        }

        final WxMaService wxService = WxMaConfiguration.getMaServices().get(appid);
        if (wxService == null) {
            throw new IllegalArgumentException(String.format("未找到对应appid=[%d]的配置，请核实！", appid));
        }

        if (wxService.checkSignature(timestamp, nonce, signature)) {
            return echostr;
        }

        return "非法请求";
    }

    @PostMapping(produces = "application/xml; charset=UTF-8")
    public String post(@PathVariable String appid,
                       @RequestBody String requestBody,
                       @RequestParam("msg_signature") String msgSignature,
                       @RequestParam("encrypt_type") String encryptType,
                       @RequestParam("signature") String signature,
                       @RequestParam("timestamp") String timestamp,
                       @RequestParam("nonce") String nonce) throws WxErrorException {
        log.info("\n接收微信请求：[msg_signature=[{}], encrypt_type=[{}], signature=[{}]," +
                        " timestamp=[{}], nonce=[{}], requestBody=[\n{}\n] ",
                msgSignature, encryptType, signature, timestamp, nonce, requestBody);

        final WxMaService wxService = WxMaConfiguration.getMaServices().get(appid);
        if (wxService == null) {
            throw new IllegalArgumentException(String.format("未找到对应appid=[%d]的配置，请核实！", appid));
        }

        final boolean isJson = Objects.equals(wxService.getWxMaConfig().getMsgDataFormat(),
                WxMaConstants.MsgDataFormat.JSON);
        if (StringUtils.isBlank(encryptType)) {
            // 明文传输的消息
            WxMaMessage inMessage;
            if (isJson) {
                inMessage = WxMaMessage.fromJson(requestBody);
            } else {//xml
                inMessage = WxMaMessage.fromXml(requestBody);
            }

            this.route(inMessage, appid);
            return "success";
        }

        if ("aes".equals(encryptType)) {
            // 是aes加密的消息
            WxMaMessage inMessage;
            if (isJson) {
                inMessage = WxMaMessage.fromEncryptedJson(requestBody, wxService.getWxMaConfig());
            } else {//xml
                inMessage = WxMaMessage.fromEncryptedXml(requestBody, wxService.getWxMaConfig(),
                        timestamp, nonce, msgSignature);
            }
            log.debug("<--msg-->{}", inMessage);


//            String content = inMessage.getContent();
//            String reply = getTuling(content, inMessage.getFromUser());

//            this.route(inMessage, appid);

            // 回复
            WxMaKefuMessage msg = WxMaKefuMessage.newTextBuilder().toUser(inMessage.getFromUser()).content("更多问题请加客服微信:[wangweijava]").build();
            wxService.getMsgService().sendKefuMsg(msg);


            return "success";
        }

        throw new RuntimeException("不可识别的加密类型：" + encryptType);
    }

    private static String getTuling(String content, String userId) {
        if (StringUtils.isBlank(content)) {
            return null;
        }


        TulingRequest dto = TulingRequest.builder()
                .reqType(0)
                .perception(TulingRequest.Perception.builder().inputText(TulingRequest.Perception.inputText(content)).build())
                .userInfo(new TulingRequest.UserInfo("92abc57cc89f487189e7b6e26de8d6b6", userId))
                .build();
        System.out.println(JSON.toJSONString(dto));

        RestTemplate restTemplate = new RestTemplate();
        List<HttpMessageConverter<?>> converterList = restTemplate.getMessageConverters();

        HttpMessageConverter<?> converter = new StringHttpMessageConverter(Charset.forName("UTF-8"));
        converterList.add(0, converter);
        restTemplate.setMessageConverters(converterList);

        HttpHeaders headers = new HttpHeaders();
        //设置类型
        MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
        headers.setContentType(type);
        headers.add("Accept", MediaType.APPLICATION_JSON.toString());
        HttpEntity<TulingRequest> entity = new HttpEntity<>(dto, headers);

        String result = restTemplate.postForObject(TULING_URL, entity, String.class);
        System.out.println(result);

        TulingResponse data = JSON.parseObject(result, TulingResponse.class);



        data.getResults().forEach(i ->{
            String value = (String) i.getValues().get(i.getResultType());
        });

        TulingResponse.Result r = data.getResults().get(0);
        return (String) r.getValues().get(r.getResultType());


    }

    public static void main(String[] args) {
        getTuling("你好，美女！", "12931");

    }

    private void route(WxMaMessage message, String appid) {
        try {
            WxMaConfiguration.getRouters().get(appid).route(message);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }


}
