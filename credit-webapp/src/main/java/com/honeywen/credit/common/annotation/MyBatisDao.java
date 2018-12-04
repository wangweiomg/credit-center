package com.honeywen.credit.common.annotation;

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 * @author wangwei
 * @date 2018/12/4 下午6:41
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Documented
@Component
public @interface MyBatisDao {

    String value() default "";
}
