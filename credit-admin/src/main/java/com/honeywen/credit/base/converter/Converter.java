package com.honeywen.credit.base.converter;

/**
 * Created by wangwei on 2017/8/28.
 */
public interface Converter<S, T> {


    T convert(S source);

}
