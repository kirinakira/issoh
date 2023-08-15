package com.issoh.attendance.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.io.Serializable;
import java.util.Date;

public class Attendance extends BaseEntity implements Serializable {

   /* 社員ID*/
    private Long employee_id;
    /*スケジューリング日付*/
    private Date date;

    private Date opening;


    private Date closing;





}
