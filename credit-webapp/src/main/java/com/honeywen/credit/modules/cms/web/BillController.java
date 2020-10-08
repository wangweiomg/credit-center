package com.honeywen.credit.modules.cms.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author wangwei
 * @date 2020/7/7
 */
@CrossOrigin(origins = "*", maxAge = 3600)
@Slf4j
@RestController
@RequestMapping("/bill")
public class BillController {


    public List<String> findAll() {
        return null;
    }

    @PostMapping("/add")
    public void add() {




    }


}
