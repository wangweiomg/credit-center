package com.honeywen.credit.controller;

import com.honeywen.credit.base.response.JsonResult;
import com.honeywen.credit.dto.EventDTO;
import com.honeywen.credit.model.Card;
import com.honeywen.credit.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by wangwei on 2017/9/10.
 */
@RestController
@RequestMapping("/card")
public class CardController {

    @Autowired
    private CardService cardService;

    @GetMapping("/list")
    public List<Card> findAll() {

        return cardService.findAll();
    }


    @PostMapping("/save")
    public JsonResult save(Card card) {
        cardService.save(card);

        return JsonResult.success();


    }

    @PostMapping("/update")
    public JsonResult update(Card card) {
        cardService.update(card);
        return JsonResult.success();
    }

    @PostMapping("/remove/{id}")
    public JsonResult remove(@PathVariable("id") Integer id) {
        cardService.removeById(id);
        return JsonResult.success();
    }

    @GetMapping("/overview")
    public List<EventDTO> overview() {

        return cardService.showOverview();
    }

    @GetMapping("/test")
    public JsonResult test() {
        List<Card> list = cardService.findByTest();

        return JsonResult.success(String.valueOf(list.size()));
    }

}
