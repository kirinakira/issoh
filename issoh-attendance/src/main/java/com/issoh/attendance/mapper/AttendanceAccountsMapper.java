package com.issoh.attendance.mapper;

import java.util.List;
import com.issoh.attendance.domain.AttendanceAccounts;

/**
 * 月次決算Mapper接口
 * 
 * @author issoh
 * @date 2023-08-21
 */

public interface AttendanceAccountsMapper 
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
     * 删除月次決算
     * 
     * @param accountsId 月次決算主键
     * @return 结果
     */
    public int deleteAttendanceAccountsByAccountsId(Long accountsId);

    /**
     * 批量删除月次決算
     * 
     * @param accountsIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAttendanceAccountsByAccountsIds(String[] accountsIds);
}
