package com.honeywen.credit.controller;

import com.honeywen.credit.base.BaseController;
import com.honeywen.credit.model.Card;
import com.honeywen.credit.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by wangwei on 2017/9/10.
 */
@Controller
@RequestMapping("/card")
public class CardController extends BaseController {

    @Autowired
    private CardService cardService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List<Card> findAll() {

        List<Card> cardList = cardService.findAll();
        return cardList;
    }

}
