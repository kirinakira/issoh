package com.ruoyi.attendance.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 勤務管理对象 attendance_info
 * 
 * @author issoh
 * @date 2023-08-23
 */
public class AttendanceInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 勤務ID */
    private Long attendanceId;

    /** 勤務ID */
    @Excel(name = "勤務ID")
    private Long employeeId;

    /** 日付 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日付", width = 30, dateFormat = "yyyy-MM-dd")
    private Date date;

    /** 始業時間 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "始業時間", width = 30, dateFormat = "yyyy-MM-dd")
    private Date opening;

    /** 終業時間 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "終業時間", width = 30, dateFormat = "yyyy-MM-dd")
    private Date closing;

    /** 休憩時間 */
    private Long rest;

    /** 曜日 */
    @Excel(name = "曜日")
    private String weekInfo;

    /** 出社在宅 */
    @Excel(name = "出社在宅")
    private Long isAttendance;

    /** 実働時間 */
    @Excel(name = "実働時間")
    private Long actualWork;

    /** 日付テープ */
    @Excel(name = "日付テープ")
    private Long dateType;

    /** 祝日名 */
    @Excel(name = "祝日名")
    private String holidayName;

    /** 登録状態 */
    @Excel(name = "登録状態")
    private Long sentFlag;

    /** 完成状態 */
    @Excel(name = "完成状態")
    private Long isComplete;

    /** 決算ID */
    private Long fiscalId;

    /** メモ */
    @Excel(name = "メモ")
    private String note;

    public void setAttendanceId(Long attendanceId) 
    {
        this.attendanceId = attendanceId;
    }

    public Long getAttendanceId() 
    {
        return attendanceId;
    }
    public void setEmployeeId(Long employeeId) 
    {
        this.employeeId = employeeId;
    }

    public Long getEmployeeId() 
    {
        return employeeId;
    }
    public void setDate(Date date) 
    {
        this.date = date;
    }

    public Date getDate() 
    {
        return date;
    }
    public void setOpening(Date opening) 
    {
        this.opening = opening;
    }

    public Date getOpening() 
    {
        return opening;
    }
    public void setClosing(Date closing) 
    {
        this.closing = closing;
    }

    public Date getClosing() 
    {
        return closing;
    }
    public void setRest(Long rest) 
    {
        this.rest = rest;
    }

    public Long getRest() 
    {
        return rest;
    }
    public void setWeekInfo(String weekInfo) 
    {
        this.weekInfo = weekInfo;
    }

    public String getWeekInfo() 
    {
        return weekInfo;
    }
    public void setIsAttendance(Long isAttendance) 
    {
        this.isAttendance = isAttendance;
    }

    public Long getIsAttendance() 
    {
        return isAttendance;
    }
    public void setActualWork(Long actualWork) 
    {
        this.actualWork = actualWork;
    }

    public Long getActualWork() 
    {
        return actualWork;
    }
    public void setDateType(Long dateType) 
    {
        this.dateType = dateType;
    }

    public Long getDateType() 
    {
        return dateType;
    }
    public void setHolidayName(String holidayName) 
    {
        this.holidayName = holidayName;
    }

    public String getHolidayName() 
    {
        return holidayName;
    }
    public void setSentFlag(Long sentFlag) 
    {
        this.sentFlag = sentFlag;
    }

    public Long getSentFlag() 
    {
        return sentFlag;
    }
    public void setIsComplete(Long isComplete) 
    {
        this.isComplete = isComplete;
    }

    public Long getIsComplete() 
    {
        return isComplete;
    }
    public void setFiscalId(Long fiscalId) 
    {
        this.fiscalId = fiscalId;
    }

    public Long getFiscalId() 
    {
        return fiscalId;
    }
    public void setNote(String note) 
    {
        this.note = note;
    }

    public String getNote() 
    {
        return note;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("attendanceId", getAttendanceId())
            .append("employeeId", getEmployeeId())
            .append("date", getDate())
            .append("opening", getOpening())
            .append("closing", getClosing())
            .append("rest", getRest())
            .append("weekInfo", getWeekInfo())
            .append("isAttendance", getIsAttendance())
            .append("actualWork", getActualWork())
            .append("dateType", getDateType())
            .append("holidayName", getHolidayName())
            .append("sentFlag", getSentFlag())
            .append("isComplete", getIsComplete())
            .append("fiscalId", getFiscalId())
            .append("note", getNote())
            .toString();
    }
}
