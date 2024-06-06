package com.brokurly.utils;

import java.time.DayOfWeek;
import java.time.LocalDate;

public class DateUtils {
    public static String nDaysAfterDayOfWeek(int n) {
        DayOfWeek dayOfWeek = LocalDate.now().plusDays(n).getDayOfWeek();
        return switch (dayOfWeek) {
            case MONDAY -> "월";
            case TUESDAY -> "화";
            case WEDNESDAY -> "수";
            case THURSDAY -> "목";
            case FRIDAY -> "금";
            case SATURDAY -> "토";
            case SUNDAY -> "일";
        };
    }
}