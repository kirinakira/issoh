package com.ruoyi.attendance.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.attendance.mapper.AttendanceHolidayMapper;
import com.ruoyi.attendance.domain.AttendanceHoliday;
import com.ruoyi.attendance.service.IAttendanceHolidayService;
import com.ruoyi.common.core.text.Convert;

/**
 * 祝日管理Service业务层处理
 *
 * @author issoh
 * @date 2023-08-23
 */

@Service
public class AttendanceHolidayServiceImpl implements IAttendanceHolidayService {

    private final Calendar calendar = Calendar.getInstance();
    private final static String urlString = "https://holidays-jp.github.io/api/v1/#/date.json";

    private BufferedReader in = null;

    @Autowired
    private AttendanceHolidayMapper attendanceHolidayMapper;

    /**
     * 查询祝日管理
     *
     * @param holidayId 祝日管理主键
     * @return 祝日管理
     */
    @Override
    public AttendanceHoliday selectAttendanceHolidayByHolidayId(Long holidayId) {
        return attendanceHolidayMapper.selectAttendanceHolidayByHolidayId(holidayId);
    }

    /**
     * 查询祝日管理列表
     *
     * @param attendanceHoliday 祝日管理
     * @return 祝日管理
     */
    @Override
    public List<AttendanceHoliday> selectAttendanceHolidayList(AttendanceHoliday attendanceHoliday) {
        return attendanceHolidayMapper.selectAttendanceHolidayList(attendanceHoliday);
    }

    /**
     * 新增祝日管理
     *
     * @param attendanceHoliday 祝日管理
     * @return 结果
     */
    @Override
    public int insertAttendanceHoliday(AttendanceHoliday attendanceHoliday) {
        return attendanceHolidayMapper.insertAttendanceHoliday(attendanceHoliday);
    }

    /**
     * 修改祝日管理
     *
     * @param attendanceHoliday 祝日管理
     * @return 结果
     */
    @Override
    public int updateAttendanceHoliday(AttendanceHoliday attendanceHoliday) {
        return attendanceHolidayMapper.updateAttendanceHoliday(attendanceHoliday);
    }

    /**
     * 批量删除祝日管理
     *
     * @param holidayIds 需要删除的祝日管理主键
     * @return 结果
     */
    @Override
    public int deleteAttendanceHolidayByHolidayIds(String holidayIds) {
        return attendanceHolidayMapper.deleteAttendanceHolidayByHolidayIds(Convert.toStrArray(holidayIds));
    }

    /**
     * delete holiday by id
     *
     * @param holidayId 祝日管理主键
     * @return 结果
     */
    @Override
    public int deleteAttendanceHolidayByHolidayId(Long holidayId) {
        return attendanceHolidayMapper.deleteAttendanceHolidayByHolidayId(holidayId);
    }

    @Override
    public List<AttendanceHoliday> getCurrentYearsHoliday() {
        List<AttendanceHoliday> holidayList = new ArrayList<>();
        AttendanceHoliday holiday;
        String line;
        String path = getNewUrl();
        try {
            URL url = new URL(path);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.connect();
            StringBuilder result = new StringBuilder();
            //get url request
            in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            //read the holiday from GitHub ,loop though into array ,get the holiday list
            while ((line = in.readLine()) != null) {
                result.append(line);
            }
            //
            JSONObject jsonArray = JSON.parseObject(String.valueOf(result));
            if (jsonArray != null && !jsonArray.isEmpty()) {
                System.out.println(jsonArray);
                for (Map.Entry<String, Object> entry : jsonArray.entrySet()) {
                    holiday = new AttendanceHoliday();
                    Date parse = java.sql.Date.valueOf(entry.getKey());
                    holiday.setHoliday(parse);
                    holiday.setHolidayName((String) entry.getValue());
                    holidayList.add(holiday);
                }

            }
            System.out.println(holidayList);
            return holidayList;
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }


        }
    }

    /**
     * @return
     */
    @Override
    public int batchInsertHoliday() {
        //get holiday list from git hub
        List<AttendanceHoliday> currentHolidayFromGithub = getCurrentYearsHoliday();
        //db中祝日存在の場合
        boolean flag = handleTheHoliday(currentHolidayFromGithub);//trueの場合、DBに中で,今年の祝日データ値が全部いない
        if (flag && !currentHolidayFromGithub.isEmpty()) {
            return attendanceHolidayMapper.batchInsertHoliday(currentHolidayFromGithub);

        }
        return 0;
    }

    /**
     * @param
     * @return
     */
    private boolean handleTheHoliday(List<AttendanceHoliday> gitHolidayList) {
        //get current year holidays from db
        List<AttendanceHoliday> attendanceHolidaysFromDB = attendanceHolidayMapper.selectCurrentYearHolidays();
        if (attendanceHolidaysFromDB == null || attendanceHolidaysFromDB.isEmpty()) {
            return true;
        }
        if (gitHolidayList != null || !gitHolidayList.isEmpty()) {
            for (AttendanceHoliday currentHolidayFromGit : gitHolidayList) {
                Date holidayGit = currentHolidayFromGit.getHoliday();
                String holidayNameGit = currentHolidayFromGit.getHolidayName();
                for (AttendanceHoliday currentholidayFromDB : attendanceHolidaysFromDB
                ) {
                    Date holidayFromDB = currentholidayFromDB.getHoliday();
                    String holidayNameFromDB = currentholidayFromDB.getHolidayName();
                    SimpleDateFormat targetDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String formattedDate = targetDateFormat.format(holidayFromDB);
                    // 日付一致場合
                    if (holidayGit.equals(formattedDate) && holidayNameGit.equals(holidayNameFromDB)) {
                        AttendanceHoliday diffHoliday = new AttendanceHoliday();
                        diffHoliday.setHoliday(holidayGit);
                        diffHoliday.setHolidayName(holidayNameGit);
                        attendanceHolidayMapper.insertAttendanceHoliday(diffHoliday);
                    }
                }
            }
        }
        return false;
    }


    /**
     * change url path with current year
     *
     * @return
     */
    private String getNewUrl() {
        String year = String.valueOf(calendar.get(Calendar.YEAR));
        String str = urlString.replace("#", year);
        return str;
    }
}
