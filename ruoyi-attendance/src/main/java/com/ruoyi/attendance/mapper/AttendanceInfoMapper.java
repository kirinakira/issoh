package com.ruoyi.attendance.mapper;

import java.util.List;
import com.ruoyi.attendance.domain.AttendanceInfo;

/**
 * 勤務管理Mapper接口
 * 
 * @author issoh
 * @date 2023-08-23
 */
public interface AttendanceInfoMapper 
{
    /**
     * 查询勤務管理
     * 
     * @param attendanceId 勤務管理主键
     * @return 勤務管理
     */
    public AttendanceInfo selectAttendanceInfoByAttendanceId(Long attendanceId);

    /**
     * 查询勤務管理列表
     * 
     * @param attendanceInfo 勤務管理
     * @return 勤務管理集合
     */
    public List<AttendanceInfo> selectAttendanceInfoList(AttendanceInfo attendanceInfo);

    /**
     * 新增勤務管理
     * 
     * @param attendanceInfo 勤務管理
     * @return 结果
     */
    public int insertAttendanceInfo(AttendanceInfo attendanceInfo);

    /**
     * 修改勤務管理
     * 
     * @param attendanceInfo 勤務管理
     * @return 结果
     */
    public int updateAttendanceInfo(AttendanceInfo attendanceInfo);

    /**
     * 删除勤務管理
     * 
     * @param attendanceId 勤務管理主键
     * @return 结果
     */
    public int deleteAttendanceInfoByAttendanceId(Long attendanceId);

    /**
     * 批量删除勤務管理
     * 
     * @param attendanceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAttendanceInfoByAttendanceIds(String[] attendanceIds);
}
