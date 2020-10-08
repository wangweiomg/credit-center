package com.honeywen.credit.modules.cms.web;

import com.honeywen.credit.modules.cms.service.RepaymentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 记账，记录还款
 * @author wangwei
 * @date 2020/7/7
 */
@CrossOrigin(origins = "*", maxAge = 3600)
@Slf4j
@RestController
@RequestMapping("/repay")
public class RepaymentController {

    @Autowired
    private RepaymentService repaymentService;

    @PostMapping("/add/{cardId}")
    public void add(@PathVariable("cardId") Integer cardId) {


        repaymentService.clearCard(cardId);





    }


}
