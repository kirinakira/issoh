package com.issoh.attendance.mapper;

import java.util.List;

import com.issoh.attendance.domain.Holiday;
import org.apache.ibatis.annotations.Mapper;

/**
 * 祝日管理Mapper接口
 *
 * @author issoh
 * @date 2023-08-21
 */
@Mapper
public interface HolidayMapper {
    /**
     * 查询祝日管理
     *
     * @param holidayId 祝日管理主键
     * @return 祝日管理
     */
    public Holiday selectHolidayByHolidayId(Long holidayId);

    /**
     * 查询祝日管理列表
     *
     * @param holiday 祝日管理
     * @return 祝日管理集合
     */
    public List<Holiday> selectHolidayList(Holiday holiday);

    /**
     * 新增祝日管理
     *
     * @param holiday 祝日管理
     * @return 结果
     */
    public int insertHoliday(Holiday holiday);

    /**
     * @param holidayList
     * @return
     */
    public int batchInsertHoliday(List<Holiday> holidayList);

    /**
     * 修改祝日管理
     *
     * @param holiday 祝日管理
     * @return 结果
     */
    public int updateHoliday(Holiday holiday);

    /**
     * 删除祝日管理
     *
     * @param holidayId 祝日管理主键
     * @return 结果
     */
    public int deleteHolidayByHolidayId(Long holidayId);

    /**
     * 批量删除祝日管理
     *
     * @param holidayIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHolidayByHolidayIds(String[] holidayIds);

}
