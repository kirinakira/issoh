package com.ruoyi.attendance.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.attendance.domain.AttendanceInfo;
import com.ruoyi.attendance.service.IAttendanceInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 勤務管理Controller
 * 
 * @author issoh
 * @date 2023-08-23
 */
@Controller
@RequestMapping("/attendance/info")
public class AttendanceInfoController extends BaseController
{
    private String prefix = "attendance/info";

    @Autowired
    private IAttendanceInfoService attendanceInfoService;

    @RequiresPermissions("attendance:info:view")
    @GetMapping()
    public String info()
    {
        return prefix + "/info";
    }

    /**
     * 查询勤務管理列表
     */
    @RequiresPermissions("attendance:info:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(AttendanceInfo attendanceInfo)
    {
        startPage();
        List<AttendanceInfo> list = attendanceInfoService.selectAttendanceInfoList(attendanceInfo);
        return getDataTable(list);
    }

    /**
     * 导出勤務管理列表
     */
    @RequiresPermissions("attendance:info:export")
    @Log(title = "勤務管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(AttendanceInfo attendanceInfo)
    {
        List<AttendanceInfo> list = attendanceInfoService.selectAttendanceInfoList(attendanceInfo);
        ExcelUtil<AttendanceInfo> util = new ExcelUtil<AttendanceInfo>(AttendanceInfo.class);
        return util.exportExcel(list, "勤務管理数据");
    }

    /**
     * 新增勤務管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存勤務管理
     */
    @RequiresPermissions("attendance:info:add")
    @Log(title = "勤務管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(AttendanceInfo attendanceInfo)
    {
        return toAjax(attendanceInfoService.insertAttendanceInfo(attendanceInfo));
    }

    /**
     * 修改勤務管理
     */
    @RequiresPermissions("attendance:info:edit")
    @GetMapping("/edit/{attendanceId}")
    public String edit(@PathVariable("attendanceId") Long attendanceId, ModelMap mmap)
    {
        AttendanceInfo attendanceInfo = attendanceInfoService.selectAttendanceInfoByAttendanceId(attendanceId);
        mmap.put("attendanceInfo", attendanceInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存勤務管理
     */
    @RequiresPermissions("attendance:info:edit")
    @Log(title = "勤務管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(AttendanceInfo attendanceInfo)
    {
        return toAjax(attendanceInfoService.updateAttendanceInfo(attendanceInfo));
    }

    /**
     * 删除勤務管理
     */
    @RequiresPermissions("attendance:info:remove")
    @Log(title = "勤務管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(attendanceInfoService.deleteAttendanceInfoByAttendanceIds(ids));
    }
}
