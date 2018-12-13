package com.honeywen.credit.modules.wx.job;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaKefuMessage;
import cn.binarywang.wx.miniapp.bean.WxMaTemplateData;
import cn.binarywang.wx.miniapp.bean.WxMaTemplateMessage;
import com.google.common.collect.Lists;
import com.honeywen.credit.modules.cms.service.CardService;
import com.honeywen.credit.modules.sys.entity.SysUser;
import com.honeywen.credit.modules.sys.utils.UserUtils;
import com.honeywen.credit.modules.wx.config.WxMaConfiguration;
import com.honeywen.credit.modules.wx.config.WxMaProperties;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @author wangwei
 * @date 2018/12/12 下午10:38
 */
@Slf4j
@Component
@Lazy(value = false)
public class NoticeSchedule {





    @Autowired
    private WxMaProperties wxMaProperties;
    @Autowired
    private CardService cardService;

    /**
     * 信用卡还款提醒
     *  - 银行
     *  - 还款日
     *  - 距离还款日
     *  - 今日最长免息期卡
     *
     */
    public static final String CREDIT_REPAY_TEMPLATE = "teQ0KiurQeXO_4mC3ULBj4XJLwgjTNGTiBuqsCVlQxA";

//    @Scheduled(cron = "*/10 * * * * *")
    public void test() {
        log.debug("hello schedule-->{}", wxMaProperties.getAppid());

        SysUser user = UserUtils.get(2);



        final WxMaService wxService = WxMaConfiguration.getMaServices().get(wxMaProperties.getAppid());
        try {

            wxService.getMsgService().sendTemplateMsg(WxMaTemplateMessage.builder()
                    .toUser(user.getWxOpenId()).formId("")
                    .templateId(CREDIT_REPAY_TEMPLATE).build());
        } catch (WxErrorException e) {
            e.printStackTrace();
            log.error("send msg error", e);
        }


        // 发送给管理员，
        SysUser admin = UserUtils.get(2);
        WxMaService service = WxMaConfiguration.getMaServices().get("");

    }
}
