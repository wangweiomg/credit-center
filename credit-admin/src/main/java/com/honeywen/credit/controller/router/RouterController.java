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


    @RequestMapping("/card/index")
    public String card() {
        return "modules/card/card-index";

    }
}
