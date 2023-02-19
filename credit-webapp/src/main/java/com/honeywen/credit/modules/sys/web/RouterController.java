package com.honeywen.credit.modules.sys.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author weiw@opera.com
 * @date 2018/9/15 下午5:00
 */
@Controller
@RequestMapping("/router")
public class RouterController {


    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/crud")
    public String crud() {
        return "crud";
    }

    @RequestMapping("/demo")
    public String demo() {
        return "demo";
    }


    @GetMapping("/card/index")
    public String card() {
        return "modules/card-index";

    }
    @GetMapping("/card/overview")
    public String cardOverview() {
        return "modules/card-overview";
    }

    @GetMapping("/card/list")
    public String cardList() {
        return "modules/card-list";
    }

    @GetMapping("/card/bill")
    public String cardBill() {
        return "modules/card-bill";
    }

    @RequestMapping("/plan/index")
    public String plan() {
        return "modules/plan-index";

    }
}
