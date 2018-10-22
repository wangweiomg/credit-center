package com.honeywen.credit.controller;

import com.github.pagehelper.Page;
import com.honeywen.credit.base.response.JsonResult;
import com.honeywen.credit.dto.EventDTO;
import com.honeywen.credit.model.Card;
import com.honeywen.credit.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 卡片控制类
 *
 * @author wangwei
 * @date 2018/09/10
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
    public Page<Card> test() {
        return cardService.findByTest();
    }

}
