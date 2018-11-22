package com.honeywen.credit.model;

import com.honeywen.credit.base.BaseModel;
import lombok.Data;

/**
 * @author wangwei
 * @date 2018/11/22 上午8:18
 */
public @Data class SysMenu extends BaseModel {

    private Integer id;
    private Integer parentId;
    private String parentIds;
    private String name;
    private Integer type;
    private String permission;
    private Integer sort;
    private String url;
    private String icon;
    private Integer status;
    private String remark;

}
