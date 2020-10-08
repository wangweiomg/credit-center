package com.honeywen.credit.base.response;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import lombok.Data;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;

import java.io.Serializable;
import java.util.Map;

/**
 * @author weiw@opera.com
 * @date 2018/9/26 上午9:42
 */
public @Data class BaseResult implements Serializable {



    private int code;
    private String message;
    private Object body;


    private BaseResult() {
    }

    private BaseResult(int code, String message, Object body) {
        this.code = code;
        this.message = message;
        this.body = body;
    }


    public static BaseResult success() {
        return new BaseResult(HttpStatus.OK.value(), HttpStatus.OK.name(), null);

    }

    public static BaseResult success(String msg) {
        return new BaseResult(HttpStatus.OK.value(), msg, null);
    }

    public static BaseResult success(Object body) {
        return new BaseResult(HttpStatus.OK.value(), HttpStatus.OK.name(), body);
    }

    public static BaseResult error(int code, String msg) {

        return new BaseResult(code, msg, null);
    }


    public static void main(String[] args) {

        BaseResult r1 = BaseResult.success();
        Map<String, Object> map = Maps.newHashMap();
        map.put("score", "93.23");

        BaseResult r2 = BaseResult.success(map);

        System.out.println(JSON.toJSONString(r1));
        System.out.println(JSON.toJSONString(r2));


        com.alibaba.fastjson.JSONObject json2 = new com.alibaba.fastjson.JSONObject();
        System.out.println(json2.get("abc"));
        JSONObject json = new JSONObject();
        System.out.println(json.get("abc"));

    }


}
