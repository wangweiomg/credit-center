package com.honeywen.credit.config;

import cn.binarywang.wx.miniapp.bean.WxMaKefuMessage;
import cn.binarywang.wx.miniapp.bean.WxMaTemplateData;
import cn.binarywang.wx.miniapp.bean.WxMaTemplateMessage;
import cn.binarywang.wx.miniapp.message.WxMaMessageHandler;
import com.google.common.collect.Lists;
import org.springframework.context.annotation.Configuration;

/**
 * @author wangwei
 * @date 2018/11/7 上午9:41
 */
@Configuration
public class WxMaConfigurationProperties {

    private final WxMaMessageHandler templateMsgHandler = (wxMessage, context, service, sessionManager) ->
            service.getMsgService().sendTemplateMsg(WxMaTemplateMessage.builder()
                    .templateId("my template msg id")
                    .formId("my form id")
                    .data(Lists.newArrayList(
                            new WxMaTemplateData("keyword1", "hello world", "#173177"),
                            new WxMaTemplateData("keyword2", "hello world2", "#173177")
                    ))
                    .toUser(wxMessage.getFromUser())
                    .build());


    private final WxMaMessageHandler logHandler = (wxMessage, context, service, sessionManager) -> {
        System.out.println("receive msg: " + wxMessage.toString());
        service.getMsgService().sendKefuMsg(WxMaKefuMessage.newTextBuilder().content("receive:" + wxMessage.toJson())
                .toUser(wxMessage.getFromUser()).build());
    };

}
