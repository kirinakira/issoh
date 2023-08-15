package com.ruoyi.common.enums;

public enum DateType {
    /**
     * 日付テープ
     * 0平日
     * 1休日
     * 2祝日
     */
    WORKDAY("0", "正常"), WEEDEND("1", "休日"), HOLIDAY("2", "祝日");

    private final String code;
    private final String info;

    DateType(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }


}
