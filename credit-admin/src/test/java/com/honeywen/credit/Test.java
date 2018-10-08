package com.honeywen.credit;


import java.time.LocalDate;
import java.time.Month;

/**
 * @author weiw@opera.com
 * @date 2018/9/17 下午7:29
 */
public class Test {



    @org.junit.Test
    public void test1() {

        LocalDate date = LocalDate.now();
        System.out.println(date);
        System.out.println(date.toString());
        Month month = date.getMonth();
        System.out.println(month);
        System.out.println(month.getValue());


        System.out.println(date.withDayOfMonth(12));
        System.out.println(date.withDayOfMonth(2));
    }

}
