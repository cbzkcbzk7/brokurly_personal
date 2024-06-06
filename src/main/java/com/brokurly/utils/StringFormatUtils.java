package com.brokurly.utils;

import com.brokurly.exception.InvalidPhoneNumberException;

public class StringFormatUtils {
    private StringFormatUtils() {}

    public static String formatPhoneNumber(String phoneNumber) {
        if (phoneNumber == null)
            throw new InvalidPhoneNumberException("휴대폰 번호가 null 입니다.");
        else if (!(phoneNumber.length() == 11 && phoneNumber.matches("\\d+")))
            throw new InvalidPhoneNumberException("휴대폰 번호는 11자리 숫자여야 합니다.");
        else if (!phoneNumber.startsWith("010"))
            throw new InvalidPhoneNumberException("휴대폰 번호는 010으로 시작해야 합니다.");

        return phoneNumber.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
    }
}
