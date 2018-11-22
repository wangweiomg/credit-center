package com.honeywen.credit.model;

import com.honeywen.credit.base.BaseModel;
import lombok.Data;

/**
 * @author wangwei
 * @date 2018/11/22 上午8:18
 */
public @Data class SysDict extends BaseModel {

    private Integer id;
    private String type;
    private String label;
    private String value;
    private String description;
    private Integer sort;
    private String remark;
}

