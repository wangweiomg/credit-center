package com.honeywen.credit.modules.wx.dto;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Map;

/**
 * 发送图灵机器人的请求dto
 * @author wangwei
 * @date 2018/12/14 上午11:05
 */
public @Data @Builder class TulingRequest implements Serializable {

    /**
     * 输入类型:0-文本(默认)、1-图片、2-音频
     */
    private Integer reqType;
    private Perception perception;
    private UserInfo userInfo;


    public static @Data @Builder  class Perception {
        private Map<String, Object> inputText;
        private Map<String, Object> inputImage;
        private Map<String, Object> inputMedia;
        private Map<String, Object> selfInfo;

        public static Map<String, Object> inputText(String text) {
            return ImmutableMap.<String, Object>builder().put("text", text).build();
        }
        public static Map<String, Object> inputImage(String url) {
            return ImmutableMap.<String, Object>builder().put("url", url).build();
        }
        public static Map<String, Object> inputMedia(String url) {
            return ImmutableMap.<String, Object>builder().put("url", url).build();
        }

    }

    public static @Data @AllArgsConstructor @NoArgsConstructor class UserInfo {
        private String apiKey;
        private String userId;
//        private String userIdName;
//        private String groupId;
    }

}
