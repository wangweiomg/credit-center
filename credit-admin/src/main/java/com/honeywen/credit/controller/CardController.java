package com.honeywen.credit.controller;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.config.WxMaConfig;
import com.github.pagehelper.Page;
import com.honeywen.credit.base.response.JsonResult;
import com.honeywen.credit.dto.EventDTO;
import com.honeywen.credit.model.Card;
import com.honeywen.credit.service.CardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 卡片控制类
 *
 * @author wangwei
 * @date 2018/09/10
 */
@Slf4j
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
    public JsonResult save(@RequestBody Card card) {
        log.debug("<--request--> card-->{}", card);
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

    @GetMapping("/test2")
    public Map<String, Object> test2() {
        return cardService.findByTest2();
    }

    @GetMapping("/test3")
    public Map<String, Object> test3() {
        return cardService.findByTest3();
    }

}
