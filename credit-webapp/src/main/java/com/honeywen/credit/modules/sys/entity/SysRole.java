package com.honeywen.credit.modules.sys.entity;

import com.honeywen.credit.base.BaseModel;
import lombok.Data;

/**
 * @author wangwei
 * @date 2018/11/22 上午8:18
 */
public @Data class SysRole extends BaseModel {

    private Integer id;
    private String name;
    private Integer type;
    private String remark;
}
