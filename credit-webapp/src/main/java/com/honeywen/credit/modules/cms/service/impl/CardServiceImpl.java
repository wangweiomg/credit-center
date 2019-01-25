package com.honeywen.credit.modules.cms.service.impl;

import com.google.common.collect.Lists;
import com.honeywen.credit.common.utils.StringUtils;
import com.honeywen.credit.modules.cms.dto.EventDTO;
import com.honeywen.credit.modules.cms.entity.Card;
import com.honeywen.credit.modules.cms.dao.CardDao;
import com.honeywen.credit.modules.cms.service.BatchService;
import com.honeywen.credit.modules.cms.service.CardService;
import com.honeywen.credit.modules.sys.entity.SysUser;
import com.honeywen.credit.modules.sys.utils.UserUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Created by wangwei on 2017/9/10.
 */
@Slf4j
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class CardServiceImpl implements CardService {


    @Autowired
    private CardDao cardDao;
    @Autowired
    private BatchService batchService;

    @Override
    public List<Card> findAll() {
        return cardDao.findAll();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Card save(Card card) {

        if (card.getCardType() == null) {
            card.setCardType(Card.CardTypeEnum.CREDIT_CARD.getValue());
        }

        if (card.getStatus() == null) {
            card.setStatus(Card.StatusEnum.ON.getValue());
        }

        SysUser user = UserUtils.getByWxOpenId(card.getWxOpenId());
        if (user == null) {
            card.setUserId(1);
        } else {
            card.setUserId(user.getId());
        }

        if (card.getMultipleNum() != null) {

            int num = card.getMultipleNum();

            List<Card> list = Lists.newArrayListWithCapacity(num);

            for (int i = 0; i < card.getMultipleNum(); i++) {
                card.setName(card.getName());
                list.add(card);
            }

            cardDao.saveList(list);

        } else {

            cardDao.save(card);
        }


        return card;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void removeById(Integer id) {
        cardDao.removeById(id);
    }

    @Override
    public List<EventDTO> showOverview() {

        List<Card> cards = cardDao.findAll();
        final LocalDate now = LocalDate.now();

        List<EventDTO> list = Lists.newArrayListWithCapacity(cards.size() * 2);
        cards.forEach(card -> {
            list.add(EventDTO.builder().title("账单日 - " + card.getName()).start(now.withDayOfMonth(card.getBillDay()).toString()).color("#008B00").build());

            int repayDayNum = getCardRepayDay(card);

            list.add(EventDTO.builder().title("还款日 - " + card.getName()).start(now.withDayOfMonth(repayDayNum).toString()).color("#FF0000").build());
        });

        return list;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(Card card) {

        cardDao.update(card);

    }


    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public void removeByIds(String ids) {

        Arrays.stream(ids.split(",")).forEach(i -> {
            try {
                batchService.deleteCardById(i);
            } catch (Exception e) {
                log.error("<--删除失败--> id-->" + i, e);
            }
        });


    }

    /**
     * 为用户初始化五个测试
     * @param userId
     */
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public void initTestCards(Integer userId) {


        Card card1 = new Card();
        Card card2 = new Card();
        Card card3 = new Card();
        Card card4 = new Card();
        Card card5 = new Card();

        card1.setUserId(userId);
        card2.setUserId(userId);
        card3.setUserId(userId);
        card4.setUserId(userId);
        card5.setUserId(userId);

        card1.setName("工商银行-测试");
        card2.setName("招行银行-测试");
        card3.setName("广发银行-测试");
        card4.setName("中信银行-测试");
        card5.setName("农业银行-测试");

        card1.setCardType(Card.CardTypeEnum.CREDIT_CARD.getValue());
        card2.setCardType(Card.CardTypeEnum.CREDIT_CARD.getValue());
        card3.setCardType(Card.CardTypeEnum.CREDIT_CARD.getValue());
        card4.setCardType(Card.CardTypeEnum.CREDIT_CARD.getValue());
        card5.setCardType(Card.CardTypeEnum.CREDIT_CARD.getValue());

        card1.setCardLimit(BigDecimal.valueOf(35000));
        card2.setCardLimit(BigDecimal.valueOf(68000));
        card3.setCardLimit(BigDecimal.valueOf(60000));
        card4.setCardLimit(BigDecimal.valueOf(40000));
        card5.setCardLimit(BigDecimal.valueOf(43000));

        card1.setBillDay(5);
        card2.setBillDay(12);
        card3.setBillDay(15);
        card4.setBillDay(17);
        card5.setBillDay(22);

        card1.setRepayDayType(Card.RepayDayTypeEnum.FIXED_DAY.getValue());
        card2.setRepayDayType(Card.RepayDayTypeEnum.FIXED_DAY.getValue());
        card3.setRepayDayType(Card.RepayDayTypeEnum.FIXED_DAY.getValue());
        card4.setRepayDayType(Card.RepayDayTypeEnum.DELAY_DAY.getValue());
        card5.setRepayDayType(Card.RepayDayTypeEnum.FIXED_DAY.getValue());

        card1.setRepayDayNum(25);
        card2.setRepayDayNum(1);
        card3.setRepayDayNum(5);
        card4.setRepayDayNum(20);
        card5.setRepayDayNum(13);

        card1.setStatus(Card.StatusEnum.ON.getValue());
        card2.setStatus(Card.StatusEnum.ON.getValue());
        card3.setStatus(Card.StatusEnum.ON.getValue());
        card4.setStatus(Card.StatusEnum.ON.getValue());
        card5.setStatus(Card.StatusEnum.ON.getValue());

        card1.setCreateBy(1);
        card2.setCreateBy(1);
        card3.setCreateBy(1);
        card4.setCreateBy(1);
        card5.setCreateBy(1);


        List<Card> list = Lists.newArrayList(card1, card2, card3, card4, card5);
        cardDao.saveList(list);
    }

    @Override
    public List<Card> findList(String wxOpenId) {



        if (StringUtils.isEmpty(wxOpenId)) {
            return Collections.emptyList();
        }

        SysUser user = UserUtils.getByWxOpenId(wxOpenId);
        if (user == null) {
            return Collections.emptyList();
        }
        Card param = new Card();
        param.setUserId(user.getId());

        return cardDao.findList(param);
    }

    private int getCardRepayDay(Card card) {

        Integer repayDayType = card.getRepayDayType();
        if (repayDayType == Card.RepayDayTypeEnum.FIXED_DAY.getValue()) {
            return card.getRepayDayNum();
        } else if (repayDayType == Card.RepayDayTypeEnum.DELAY_DAY.getValue()) {
            return LocalDate.now().withDayOfMonth(card.getBillDay()).plusDays(card.getRepayDayNum()).getDayOfMonth();
        } else {
            return 0;
        }
    }
}
