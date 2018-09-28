package com.honeywen.credit.controller;

import com.google.common.collect.Lists;
import com.honeywen.credit.dto.EventDTO;
import com.honeywen.credit.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author weiw@opera.com
 * @date 2018/9/17 下午9:16
 */
@RestController
@RequestMapping("/plan")
public class PlanController {


    @Autowired
    private PlanService planService;

    @GetMapping("/event/list")
    public List<EventDTO> myPlan() {


        EventDTO event1 = EventDTO.builder().title("刷建行1105").start("2018-09-26").build();
        EventDTO event11 = EventDTO.builder().title("刷农行1105").start("2018-09-26").build();
        EventDTO event12 = EventDTO.builder().title("刷交行1105").start("2018-09-26").build();
        EventDTO event2 = EventDTO.builder().title("刷工行3005").start("2018-09-02").build();
        EventDTO event3 = EventDTO.builder().title("刷农行2391").start("2018-09-16").build();
        EventDTO event4 = EventDTO.builder().title("刷广发8888").start("2018-09-29").build();
        EventDTO event5 = EventDTO.builder().title("刷中行1111").start("2018-09-30").build();

        ArrayList<EventDTO> list = Lists.newArrayList(event1, event2, event3, event4, event5, event11, event12);
        return list;


    }



}
