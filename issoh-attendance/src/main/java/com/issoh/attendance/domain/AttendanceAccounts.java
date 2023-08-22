package com.issoh.attendance.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 月次決算对象 attendance_accounts
 * 
 * @author ruoyi
 * @date 2023-08-21
 */

public class AttendanceAccounts extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 計算ID */
    private Long accountsId;

    /** 社員ID */
    @Excel(name = "社員ID")
    private Long employeeId;

    /** 出勤日数 */
    @Excel(name = "出勤日数")
    private Long attendanceDay;

    /** 就業時間 */
    @Excel(name = "就業時間")
    private Long totalHour;

    /** 深夜残業 */
    @Excel(name = "深夜残業")
    private Long nightOvertime;

    /** 休日残業 */
    @Excel(name = "休日残業")
    private Long restOvertime;

    /** 残業 */
    @Excel(name = "残業")
    private Long overtime;

    /** 出勤日次 */
    @Excel(name = "出勤日次")
    private Long attendanceCount;

    /** 振替休 */
    @Excel(name = "振替休")
    private Long adjustVacation;

    /** 遅刻 */
    @Excel(name = "遅刻")
    private Long late;

    /** 早退 */
    @Excel(name = "早退")
    private Long leaveEarly;

    /** 欠勤 */
    @Excel(name = "欠勤")
    private Long absenteeism;

    /** 病欠 */
    @Excel(name = "病欠")
    private Long sickLeave;

    /** 有給休暇 */
    @Excel(name = "有給休暇")
    private Long paidTimeOff;

    /** 作成者 */
    @Excel(name = "作成者")
    private String creater;

    /** 削除フラグ（0正常 2削除） */
    private Long delFlag;

    /** 決算（ 0未決算1決算） */
    @Excel(name = "決算", readConverterExp = "0=未決算1決算")
    private Long isFinal;

    public void setAccountsId(Long accountsId) 
    {
        this.accountsId = accountsId;
    }

    public Long getAccountsId() 
    {
        return accountsId;
    }
    public void setEmployeeId(Long employeeId) 
    {
        this.employeeId = employeeId;
    }

    public Long getEmployeeId() 
    {
        return employeeId;
    }
    public void setAttendanceDay(Long attendanceDay) 
    {
        this.attendanceDay = attendanceDay;
    }

    public Long getAttendanceDay() 
    {
        return attendanceDay;
    }
    public void setTotalHour(Long totalHour) 
    {
        this.totalHour = totalHour;
    }

    public Long getTotalHour() 
    {
        return totalHour;
    }
    public void setNightOvertime(Long nightOvertime) 
    {
        this.nightOvertime = nightOvertime;
    }

    public Long getNightOvertime() 
    {
        return nightOvertime;
    }
    public void setRestOvertime(Long restOvertime) 
    {
        this.restOvertime = restOvertime;
    }

    public Long getRestOvertime() 
    {
        return restOvertime;
    }
    public void setOvertime(Long overtime) 
    {
        this.overtime = overtime;
    }

    public Long getOvertime() 
    {
        return overtime;
    }
    public void setAttendanceCount(Long attendanceCount) 
    {
        this.attendanceCount = attendanceCount;
    }

    public Long getAttendanceCount() 
    {
        return attendanceCount;
    }
    public void setAdjustVacation(Long adjustVacation) 
    {
        this.adjustVacation = adjustVacation;
    }

    public Long getAdjustVacation() 
    {
        return adjustVacation;
    }
    public void setLate(Long late) 
    {
        this.late = late;
    }

    public Long getLate() 
    {
        return late;
    }
    public void setLeaveEarly(Long leaveEarly) 
    {
        this.leaveEarly = leaveEarly;
    }

    public Long getLeaveEarly() 
    {
        return leaveEarly;
    }
    public void setAbsenteeism(Long absenteeism) 
    {
        this.absenteeism = absenteeism;
    }

    public Long getAbsenteeism() 
    {
        return absenteeism;
    }
    public void setSickLeave(Long sickLeave) 
    {
        this.sickLeave = sickLeave;
    }

    public Long getSickLeave() 
    {
        return sickLeave;
    }
    public void setPaidTimeOff(Long paidTimeOff) 
    {
        this.paidTimeOff = paidTimeOff;
    }

    public Long getPaidTimeOff() 
    {
        return paidTimeOff;
    }
    public void setCreater(String creater) 
    {
        this.creater = creater;
    }

    public String getCreater() 
    {
        return creater;
    }
    public void setDelFlag(Long delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Long getDelFlag() 
    {
        return delFlag;
    }
    public void setIsFinal(Long isFinal) 
    {
        this.isFinal = isFinal;
    }

    public Long getIsFinal() 
    {
        return isFinal;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("accountsId", getAccountsId())
            .append("employeeId", getEmployeeId())
            .append("attendanceDay", getAttendanceDay())
            .append("totalHour", getTotalHour())
            .append("nightOvertime", getNightOvertime())
            .append("restOvertime", getRestOvertime())
            .append("overtime", getOvertime())
            .append("attendanceCount", getAttendanceCount())
            .append("adjustVacation", getAdjustVacation())
            .append("late", getLate())
            .append("leaveEarly", getLeaveEarly())
            .append("absenteeism", getAbsenteeism())
            .append("sickLeave", getSickLeave())
            .append("paidTimeOff", getPaidTimeOff())
            .append("createTime", getCreateTime())
            .append("creater", getCreater())
            .append("delFlag", getDelFlag())
            .append("isFinal", getIsFinal())
            .toString();
    }
}
