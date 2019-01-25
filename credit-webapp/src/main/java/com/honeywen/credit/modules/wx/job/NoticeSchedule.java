package com.honeywen.credit.modules.wx.job;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaKefuMessage;
import com.honeywen.credit.modules.cms.entity.Card;
import com.honeywen.credit.modules.cms.service.CardService;
import com.honeywen.credit.modules.sys.utils.UserUtils;
import com.honeywen.credit.modules.wx.config.WxMaConfiguration;
import com.honeywen.credit.modules.wx.config.WxMaProperties;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

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
     * - 银行
     * - 还款日
     * - 距离还款日
     * - 今日最长免息期卡
     */
    public static final String CREDIT_REPAY_TEMPLATE = "teQ0KiurQeXO_4mC3ULBj4XJLwgjTNGTiBuqsCVlQxA";

    @Scheduled(cron = "0 0 9 * * *")
    public void test() {
        log.debug("hello schedule-->{}", wxMaProperties.getAppid());

        final WxMaService wxService = WxMaConfiguration.getMaServices().get(wxMaProperties.getAppid());
        List<Card> cardList = cardService.findAll();

        // 找出距今两天的卡片
        cardList.forEach(i -> {
            LocalDate today = LocalDate.now();
            LocalDate date = today;
            if (i.getRepayDayType() == Card.RepayDayTypeEnum.FIXED_DAY.getValue()) {
                date = today.withDayOfMonth(i.getRepayDayNum());
            }
            if (i.getRepayDayType() == Card.RepayDayTypeEnum.DELAY_DAY.getValue()) {
                date = today.withDayOfMonth(i.getBillDay()).plusDays(i.getRepayDayNum());
            }

            Integer userId = i.getUserId();
            String openId = UserUtils.get(userId).getWxOpenId();
            String repayDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

            String msg = null;
            if (date.until(today).getDays() == 2) {
                msg = "你的卡片[ " + i.getName() + " ]距离最后还款日[ " + repayDate + " ]还有2天, 请及时安排还款。";
            }
            if (date.until(today).getDays() == 0) {
                msg = "你的卡片[ " + i.getName() + " ]最后还款日[ " + repayDate + " ]是今天, 请检查是否已还清。";
            }
            if (msg != null) {
                try {
                    wxService.getMsgService().sendKefuMsg(WxMaKefuMessage.newTextBuilder().toUser(openId).content(msg).build());
                } catch (WxErrorException e) {
                    log.error("send customer msg error!", e);
                }
            }

        });

        cardList.forEach(i -> {

        });

//            wxService.getMsgService().sendTemplateMsg(WxMaTemplateMessage.builder()
//                    .toUser(user.getWxOpenId()).formId("")
//                    .templateId(CREDIT_REPAY_TEMPLATE).build());


    }
}
