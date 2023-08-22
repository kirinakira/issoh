package com.issoh.attendance.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.issoh.attendance.mapper.AttendanceAccountsMapper;
import com.issoh.attendance.domain.AttendanceAccounts;
import com.issoh.attendance.service.IAttendanceAccountsService;
import com.ruoyi.common.core.text.Convert;

/**
 * 月次決算Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-08-21
 */
@Service
public class AttendanceAccountsServiceImpl implements IAttendanceAccountsService 
{
    @Autowired
    private AttendanceAccountsMapper attendanceAccountsMapper;

    /**
     * 查询月次決算
     * 
     * @param accountsId 月次決算主键
     * @return 月次決算
     */
    @Override
    public AttendanceAccounts selectAttendanceAccountsByAccountsId(Long accountsId)
    {
        return attendanceAccountsMapper.selectAttendanceAccountsByAccountsId(accountsId);
    }

    /**
     * 查询月次決算列表
     * 
     * @param attendanceAccounts 月次決算
     * @return 月次決算
     */
    @Override
    public List<AttendanceAccounts> selectAttendanceAccountsList(AttendanceAccounts attendanceAccounts)
    {
        return attendanceAccountsMapper.selectAttendanceAccountsList(attendanceAccounts);
    }

    /**
     * 新增月次決算
     * 
     * @param attendanceAccounts 月次決算
     * @return 结果
     */
    @Override
    public int insertAttendanceAccounts(AttendanceAccounts attendanceAccounts)
    {
        attendanceAccounts.setCreateTime(DateUtils.getNowDate());
        return attendanceAccountsMapper.insertAttendanceAccounts(attendanceAccounts);
    }

    /**
     * 修改月次決算
     * 
     * @param attendanceAccounts 月次決算
     * @return 结果
     */
    @Override
    public int updateAttendanceAccounts(AttendanceAccounts attendanceAccounts)
    {
        return attendanceAccountsMapper.updateAttendanceAccounts(attendanceAccounts);
    }

    /**
     * 批量删除月次決算
     * 
     * @param accountsIds 需要删除的月次決算主键
     * @return 结果
     */
    @Override
    public int deleteAttendanceAccountsByAccountsIds(String accountsIds)
    {
        return attendanceAccountsMapper.deleteAttendanceAccountsByAccountsIds(Convert.toStrArray(accountsIds));
    }

    /**
     * 删除月次決算信息
     * 
     * @param accountsId 月次決算主键
     * @return 结果
     */
    @Override
    public int deleteAttendanceAccountsByAccountsId(Long accountsId)
    {
        return attendanceAccountsMapper.deleteAttendanceAccountsByAccountsId(accountsId);
    }
}
