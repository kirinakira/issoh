package com.issoh.attendance.service;

import com.issoh.attendance.domain.Holiday;

import java.io.IOException;
import java.util.List;

public interface HolidayService {
     List<Holiday> getCurrentYearsHoliday();
     int batchInsertHoliday();

}
