package com.brokurly.utils;

import org.apache.commons.lang3.RandomStringUtils;

public class RandomGeneratorUtils {
    private static final int SHIP_LOCA_ID_LEN = 10;

    RandomGeneratorUtils() {}

    public static String randomGeneratedShipLocaId() {
        return RandomStringUtils.randomNumeric(SHIP_LOCA_ID_LEN);
    }
}
