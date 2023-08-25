package com.ruoyi.attendance.service;

import java.util.List;
import com.ruoyi.attendance.domain.AttendanceHoliday;

/**
 * 祝日管理Service接口
 * 
 * @author issoh
 * @date 2023-08-23
 */
public interface IAttendanceHolidayService 
{
    /**
     * 查询祝日管理
     * 
     * @param holidayId 祝日管理主键
     * @return 祝日管理
     */
    public AttendanceHoliday selectAttendanceHolidayByHolidayId(Long holidayId);

    /**
     * 查询祝日管理列表
     * 
     * @param attendanceHoliday 祝日管理
     * @return 祝日管理集合
     */
    public List<AttendanceHoliday> selectAttendanceHolidayList(AttendanceHoliday attendanceHoliday);

    /**
     * 新增祝日管理
     * 
     * @param attendanceHoliday 祝日管理
     * @return 结果
     */
    public int insertAttendanceHoliday(AttendanceHoliday attendanceHoliday);

    /**
     * 修改祝日管理
     * 
     * @param attendanceHoliday 祝日管理
     * @return 结果
     */
    public int updateAttendanceHoliday(AttendanceHoliday attendanceHoliday);

    /**
     * 批量删除祝日管理
     * 
     * @param holidayIds 需要删除的祝日管理主键集合
     * @return 结果
     */
    public int deleteAttendanceHolidayByHolidayIds(String holidayIds);

    /**
     * 删除祝日管理信息
     * 
     * @param holidayId 祝日管理主键
     * @return 结果
     */
    public int deleteAttendanceHolidayByHolidayId(Long holidayId);

    /**
     * get current year`s holidays from github
     * @return
     */
    List<AttendanceHoliday> getCurrentYearsHoliday();

    /**
     * batch insert into db
     *
     * @return
     */
    int batchInsertHoliday();

}
