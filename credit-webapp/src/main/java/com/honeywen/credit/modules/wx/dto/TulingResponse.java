package com.honeywen.credit.modules.wx.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 *
 * @author wangwei
 * @date 2018/12/14 下午3:00
 */
public @Data class TulingResponse implements Serializable {

    private Intent intent;
    private List<Result> results;


    public @Data class Intent {
        private Integer code;
        private String intentName;
        private String actionName;
        private Map<String, Object> parameters;
    }
    public @Data class Result {
        private Integer groupType;
        /**
         * 文本(text);连接(url);音频(voice);视频(video);图片(image);图文(news)
         */
        private String resultType;
        private Map<String, Object> values;

    }


}
