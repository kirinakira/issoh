package com.issoh.attendance.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.issoh.attendance.domain.Holiday;
import com.issoh.attendance.mapper.HolidayMapper;
import com.issoh.attendance.service.HolidayService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class HolidayServiceImpl implements HolidayService {
    @Resource
    private HolidayMapper holidayMapper;


    private final Calendar calendar = Calendar.getInstance();
    private final static String urlString = "https://holidays-jp.github.io/api/v1/#/date.json";

    private BufferedReader in = null;

    @Override
    public int batchInsertHoliday() {

        List<Holiday> currentHoliday = getCurrentYearsHoliday();
        if (currentHoliday != null) {
            return holidayMapper.batchInsertHoliday(currentHoliday);
        }
        return 0;

    }


    @Override
    public List<Holiday> getCurrentYearsHoliday() {
        List<Holiday> holidayList = new ArrayList<>();
        Holiday holiday;
        String line;
        String path = getNewUrl();
        try {
            URL url = new URL(path);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.connect();
            StringBuffer result = new StringBuffer();
            //get url request
            in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            while ((line = in.readLine()) != null) {
                result.append(line);
            }
            JSONObject jsonArray = JSON.parseObject(String.valueOf(result));
            SimpleDateFormat format;
            if (jsonArray != null && !jsonArray.isEmpty()) {
                System.out.println(jsonArray);
                for (Map.Entry<String, Object> entry : jsonArray.entrySet()) {
                    holiday = new Holiday();
                    Date parse = java.sql.Date.valueOf(entry.getKey());
                    holiday.setHoliday(parse);
                    holiday.setHolidayName((String) entry.getValue());
                    holidayList.add(holiday);
                }

            }
            System.out.println(holidayList);
            return holidayList;
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
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
     * current year url
     *
     * @return
     */
    private String getNewUrl() {
        String year = String.valueOf(calendar.get(Calendar.YEAR));
        String str = urlString.replace("#", year);
        return str;
    }
}
