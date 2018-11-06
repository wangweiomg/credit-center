package com.honeywen.credit.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.honeywen.credit.dto.EventDTO;
import com.honeywen.credit.model.Card;
import com.honeywen.credit.repository.command.CardCommandMapper;
import com.honeywen.credit.repository.query.CardQueryMapper;
import com.honeywen.credit.service.CardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
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
    private CardQueryMapper cardQueryMapper;
    @Autowired
    private CardCommandMapper cardCommandMapper;

    @Override
    public List<Card> findAll() {
        return cardQueryMapper.findAll();
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


        cardCommandMapper.save(card);

        return card;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void removeById(Integer id) {
        cardCommandMapper.removeById(id);
    }

    @Override
    public List<EventDTO> showOverview() {

        List<Card> cards = cardQueryMapper.findAll();
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

        cardCommandMapper.update(card);

    }

    @Override
    public Page<Card> findByTest() {

        Map<String, Object> map = Maps.newHashMap();
        map.put("first", "1");
        map.put("third", 2);
        map.put("second", 3);
        PageHelper.startPage(2, 10);

        return (Page<Card>)cardQueryMapper.findByTest(map);
//        return cardQueryMapper.findByTest(map);
    }

    @Override
    public Map<String, Object> findByTest2() {
        Map<String, Object> map = Maps.newHashMap();
        map.put("first", "");
        map.put("second", 0);
        return cardQueryMapper.findByTest2(map);
    }

    @Override
    public Map<String, Object> findByTest3() {
        Map<String, Object> map = Maps.newHashMap();
        map.put("first", new String[]{"a", "b", "c"});
        map.put("second", Lists.newArrayList(3, 4));


        return cardQueryMapper.findByTest3(map);
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
