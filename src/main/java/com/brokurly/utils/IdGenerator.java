package com.brokurly.utils;

import java.security.SecureRandom;
import java.time.LocalDate;

public class IdGenerator {
    public static String generateOrderId() {
        final SecureRandom random = new SecureRandom();
        final int randomStringLength = 6;
        final String characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

        StringBuilder sb = new StringBuilder();
        sb.append(LocalDate.now().toString().replaceAll("-", ""));
        for (int i = 0; i < randomStringLength; i++) {
            sb.append(characters.charAt(random.nextInt(characters.length())));
        }
        return sb.toString();
    }

    public static String generateRcvDtlId(String custId) {
        return custId + System.currentTimeMillis();
    }
}