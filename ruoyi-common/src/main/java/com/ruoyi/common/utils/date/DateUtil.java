package com.ruoyi.common.utils.date;


import java.time.YearMonth;


public final class DateUtil {

    private static int daysInMonth;

    private static int getWeekday() {
        YearMonth yearMonth= YearMonth.now();
        daysInMonth = yearMonth.lengthOfMonth();
        System.out.println(daysInMonth);
        return daysInMonth;
    }


}
