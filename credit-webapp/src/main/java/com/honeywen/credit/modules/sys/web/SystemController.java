package com.honeywen.credit.modules.sys.web;

import com.honeywen.credit.modules.sys.entity.SysUser;
import com.honeywen.credit.modules.sys.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author wangwei
 * @date 2019/1/25 下午8:29
 */
@RestController
public class SystemController {

    @Autowired
    private SystemService systemService;

    @GetMapping("/user/list")
    public List<SysUser> findAllUser() {

        return systemService.findAllUser();
    }
}
