package com.honeywen.credit.modules.cms.web;

import com.honeywen.credit.base.response.BaseResult;
import com.honeywen.credit.modules.cms.dto.EventDTO;
import com.honeywen.credit.modules.cms.entity.Card;
import com.honeywen.credit.modules.cms.service.CardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 卡片控制类
 *
 * @author wangwei
 * @date 2018/09/10
 */
@CrossOrigin(origins = "*", maxAge = 3600)
@Slf4j
@RestController
@RequestMapping("/card")
public class CardController {

    @Autowired
    private CardService cardService;

    @GetMapping("/findAll")
    public List<Card> findAll() {

        return cardService.findAll();
    }

    @GetMapping("/list")
    public List<Card> findList(String wxOpenId) {

        return cardService.findList(wxOpenId);
    }


    @PostMapping("/save")
    public BaseResult save(@RequestBody Card card) {
        log.debug("<--request--> card-->{}", card);
        cardService.save(card);

        return BaseResult.success();


    }

    @PostMapping("/update")
    public BaseResult update(@RequestBody Card card) {
        cardService.update(card);
        return BaseResult.success();
    }

    @PostMapping("/remove/{ids}")
    public BaseResult remove(@PathVariable("ids") String ids) {
        cardService.removeByIds(ids);
        return BaseResult.success();
    }



    @GetMapping("/overview")
    public List<EventDTO> overview() {

        return cardService.showOverview();
    }


}
