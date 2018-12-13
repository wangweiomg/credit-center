package com.honeywen.credit.modules.wx.job;

import org.junit.Test;

import java.time.LocalDate;

/**
 *
 */
public class NoticeTest {

    @Test
    public void test1() {
        LocalDate now = LocalDate.now();
        LocalDate d1 = now.withDayOfMonth(11);
        LocalDate d2 = now.withDayOfMonth(16);

        int days = now.until(d1).getDays();
        System.out.println(days);
        days = now.until(d2).getDays();
        System.out.println(days);
    }

}