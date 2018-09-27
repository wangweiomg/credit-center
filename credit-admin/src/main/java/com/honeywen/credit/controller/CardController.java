package com.honeywen.credit.controller;

import com.honeywen.credit.base.response.JsonResult;
import com.honeywen.credit.model.Card;
import com.honeywen.credit.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by wangwei on 2017/9/10.
 */
@Controller
@RequestMapping("/card")
public class CardController {

    @Autowired
    private CardService cardService;

    @GetMapping("/list")
    @ResponseBody
    public List<Card> findAll() {

        return cardService.findAll();
    }


    @PostMapping("/save")
    public JsonResult save(Card card) {
        cardService.save(card);

        return JsonResult.success();


    }

}
