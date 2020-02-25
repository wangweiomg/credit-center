package com.honeywen.credit.modules.cms.web;

import com.honeywen.credit.modules.cms.entity.Fee;
import com.honeywen.credit.modules.cms.entity.House;
import com.honeywen.credit.modules.cms.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wangwei
 * @date 2019/10/22
 */
@Controller
@RequestMapping("/house")
public class HouseController {


    @Autowired
    private HouseService houseService;

    public String hello() {
        return "hello house " ;
    }




    public Fee calcFees(House house) {

        Fee fee = houseService.calcFees(house);

        return fee;


    }





}
