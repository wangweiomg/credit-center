package com.honeywen.credit.modules.cms.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.honeywen.credit.modules.cms.dto.EventDTO;
import com.honeywen.credit.modules.cms.entity.Card;
import com.honeywen.credit.modules.cms.dao.CardDao;
import com.honeywen.credit.modules.cms.service.BatchService;
import com.honeywen.credit.modules.cms.service.CardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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

        if (card.getMultipleNum() != null) {

            int num = card.getMultipleNum();

            List<Card> list = Lists.newArrayListWithCapacity(num);

            for (int i = 0; i < card.getMultipleNum(); i++) {
                card.setName(card.getName() + "-" + i + 1);
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
