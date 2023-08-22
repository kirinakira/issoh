package com.issoh.attendance.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 祝日管理对象 holiday
 * 
 * @author issoh
 * @date 2023-08-21
 */
@Data
@Setter
@Getter
public class Holiday extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 祝日ID */
    private Long holidayId;

    /** 祝日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "祝日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date holiday;

    /** 祝日名 */
    @Excel(name = "祝日名")
    private String holidayName;

    public void setHolidayId(Long holidayId) 
    {
        this.holidayId = holidayId;
    }

    public Long getHolidayId() 
    {
        return holidayId;
    }
    public void setHoliday(Date holiday) 
    {
        this.holiday = holiday;
    }

    public Date getHoliday() 
    {
        return holiday;
    }
    public void setHolidayName(String holidayName) 
    {
        this.holidayName = holidayName;
    }

    public String getHolidayName() 
    {
        return holidayName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("holidayId", getHolidayId())
            .append("holiday", getHoliday())
            .append("holidayName", getHolidayName())
            .toString();
    }
}
