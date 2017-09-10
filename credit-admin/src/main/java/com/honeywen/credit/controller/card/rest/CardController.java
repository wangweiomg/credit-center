package com.honeywen.credit.controller.card.rest;

import com.honeywen.credit.base.BaseController;
import com.honeywen.credit.model.card.Card;
import com.honeywen.credit.service.card.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    public String findAll(Model model) {

        List<Card> cardList = cardService.findAll();
        model.addAttribute("cardList", cardList);
        return "modules/card/cardList";
    }

}
