package com.honeywen.credit.controller.router;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author weiw@opera.com
 * @date 2018/9/15 下午5:00
 */
@Controller
@RequestMapping("/router")
public class RouterController {


    @RequestMapping("/card/list")
    public String toCardList() {
        return "modules/card/cardList";
    }


}
