package com.ruoyi.common.enums;

/**
 * 勤務状態
 */
public enum AttendanceStatus {
    /**
     * 0正常
     * 1遅刻
     * 2早退
     * 3欠勤
     * 4病欠
     * 5有給休暇
     * 6振替休
     */
    NORMAL("0", "正常"), LATE("1", "遅刻"), LEAVE_EARLY("2", "早退"), ABSENTEEISM("3", "欠勤"), SICK_LEAVE("4", "病欠"), PAID_TIME_OFF("5", "有給休暇"), ADJUST_VACATION("6", "振替休");

    private final String code;
    private final String info;

    AttendanceStatus(String code, String info) {
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
