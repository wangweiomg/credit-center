package com.honeywen.credit.controller;

import com.honeywen.credit.dto.EventDTO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author weiw@opera.com
 * @date 2018/9/17 下午9:16
 */
@RestController
@RequestMapping("/plan")
public class PlanController {


    @GetMapping("/event/list")
    public List<EventDTO> myPlan() {

        return null;


    }


}
