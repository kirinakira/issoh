package com.ruoyi.attendance.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.attendance.mapper.AttendanceInfoMapper;
import com.ruoyi.attendance.domain.AttendanceInfo;
import com.ruoyi.attendance.service.IAttendanceInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 勤務管理Service业务层处理
 * 
 * @author issoh
 * @date 2023-08-23
 */
@Service
public class AttendanceInfoServiceImpl implements IAttendanceInfoService 
{
    @Autowired
    private AttendanceInfoMapper attendanceInfoMapper;

    /**
     * 查询勤務管理
     * 
     * @param attendanceId 勤務管理主键
     * @return 勤務管理
     */
    @Override
    public AttendanceInfo selectAttendanceInfoByAttendanceId(Long attendanceId)
    {
        return attendanceInfoMapper.selectAttendanceInfoByAttendanceId(attendanceId);
    }

    /**
     * 查询勤務管理列表
     * 
     * @param attendanceInfo 勤務管理
     * @return 勤務管理
     */
    @Override
    public List<AttendanceInfo> selectAttendanceInfoList(AttendanceInfo attendanceInfo)
    {
        return attendanceInfoMapper.selectAttendanceInfoList(attendanceInfo);
    }

    /**
     * 新增勤務管理
     * 
     * @param attendanceInfo 勤務管理
     * @return 结果
     */
    @Override
    public int insertAttendanceInfo(AttendanceInfo attendanceInfo)
    {
        return attendanceInfoMapper.insertAttendanceInfo(attendanceInfo);
    }

    /**
     * 修改勤務管理
     * 
     * @param attendanceInfo 勤務管理
     * @return 结果
     */
    @Override
    public int updateAttendanceInfo(AttendanceInfo attendanceInfo)
    {
        return attendanceInfoMapper.updateAttendanceInfo(attendanceInfo);
    }

    /**
     * 批量删除勤務管理
     * 
     * @param attendanceIds 需要删除的勤務管理主键
     * @return 结果
     */
    @Override
    public int deleteAttendanceInfoByAttendanceIds(String attendanceIds)
    {
        return attendanceInfoMapper.deleteAttendanceInfoByAttendanceIds(Convert.toStrArray(attendanceIds));
    }

    /**
     * 删除勤務管理信息
     * 
     * @param attendanceId 勤務管理主键
     * @return 结果
     */
    @Override
    public int deleteAttendanceInfoByAttendanceId(Long attendanceId)
    {
        return attendanceInfoMapper.deleteAttendanceInfoByAttendanceId(attendanceId);
    }
}
