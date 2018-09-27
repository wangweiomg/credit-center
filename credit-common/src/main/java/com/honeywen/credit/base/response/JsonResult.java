package com.honeywen.credit.base.response;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;

import java.util.Collections;
import java.util.Map;

/**
 * @author weiw@opera.com
 * @date 2018/9/26 上午9:42
 */
public @Data class JsonResult {

    private Head head;
    private Map<String, Object> body;


    private JsonResult() {
    }

    private JsonResult(Head head, Map<String, Object> body) {
        this.head = head;
        this.body = body;
    }

    private static @Data @AllArgsConstructor class Head {

        private Integer code;
        private String msg;

        static Head success() {
            return new Head(HttpStatus.OK.value(), "Success");
        }

        static Head success(String msg) {
            return new Head(HttpStatus.OK.value(), msg);
        }

        static Head error(Integer code, String msg) {
            return new Head(code, msg);
        }
    }


    public static JsonResult success() {
        return new JsonResult(Head.success(), Collections.emptyMap());

    }

    public static JsonResult success(String msg) {
        return new JsonResult(Head.success(msg), Collections.emptyMap());
    }

    public static JsonResult success(Map<String, Object> body) {
        return new JsonResult(Head.success(), body);
    }

    public static JsonResult error(Integer code, String msg) {
        return new JsonResult(Head.error(code, msg), Collections.emptyMap());
    }


    public static void main(String[] args) {

        JsonResult r1 = JsonResult.success();
        Map<String, Object> map = Maps.newHashMap();
        map.put("score", "93.23");

        JsonResult r2 = JsonResult.success(map);

        System.out.println(JSON.toJSONString(r1));
        System.out.println(JSON.toJSONString(r2));


        com.alibaba.fastjson.JSONObject json2 = new com.alibaba.fastjson.JSONObject();
        System.out.println(json2.get("abc"));
        JSONObject json = new JSONObject();
        System.out.println(json.get("abc"));

    }


}
