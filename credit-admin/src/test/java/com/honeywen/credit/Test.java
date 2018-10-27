package com.honeywen.credit;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;

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

        LocalDateTime now = LocalDateTime.now();
        LocalDateTime t1 = now.withDayOfMonth(3);
        System.out.println(t1.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        LocalDateTime t2 = now.withHour(3);
        System.out.println(t2.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
    }

}
