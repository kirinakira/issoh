package com.issoh.attendance.service;

import java.util.List;
import com.issoh.attendance.domain.AttendanceAccounts;

/**
 * 月次決算Service接口
 * 
 * @author ruoyi
 * @date 2023-08-21
 */
public interface IAttendanceAccountsService 
{
    /**
     * 查询月次決算
     * 
     * @param accountsId 月次決算主键
     * @return 月次決算
     */
    public AttendanceAccounts selectAttendanceAccountsByAccountsId(Long accountsId);

    /**
     * 查询月次決算列表
     * 
     * @param attendanceAccounts 月次決算
     * @return 月次決算集合
     */
    public List<AttendanceAccounts> selectAttendanceAccountsList(AttendanceAccounts attendanceAccounts);

    /**
     * 新增月次決算
     * 
     * @param attendanceAccounts 月次決算
     * @return 结果
     */
    public int insertAttendanceAccounts(AttendanceAccounts attendanceAccounts);

    /**
     * 修改月次決算
     * 
     * @param attendanceAccounts 月次決算
     * @return 结果
     */
    public int updateAttendanceAccounts(AttendanceAccounts attendanceAccounts);

    /**
     * 批量删除月次決算
     * 
     * @param accountsIds 需要删除的月次決算主键集合
     * @return 结果
     */
    public int deleteAttendanceAccountsByAccountsIds(String accountsIds);

    /**
     * 删除月次決算信息
     * 
     * @param accountsId 月次決算主键
     * @return 结果
     */
    public int deleteAttendanceAccountsByAccountsId(Long accountsId);
}
