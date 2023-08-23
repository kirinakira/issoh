package com.ruoyi.quartz.task;

import com.ruoyi.attendance.service.IAttendanceHolidayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("holidayTask")
public class HolidayTask {
    @Autowired
    private IAttendanceHolidayService attendanceHolidayService;

    public void getHolidaySchedule() throws Exception {
        attendanceHolidayService.batchInsertHoliday();
    }




}
