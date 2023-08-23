package com.ruoyi.web.controller.attendance;

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
import com.ruoyi.attendance.domain.AttendanceHoliday;
import com.ruoyi.attendance.service.IAttendanceHolidayService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 祝日管理Controller
 *
 * @author issoh
 * @date 2023-08-23
 */
@Controller
@RequestMapping("/attendance/holiday")
public class AttendanceHolidayController extends BaseController {
    private String prefix = "attendance/holiday";

    @Autowired
    private IAttendanceHolidayService attendanceHolidayService;

    @RequiresPermissions("attendance:holiday:view")
    @GetMapping()
    public String holiday() {
        return prefix + "/holiday";
    }

    /**
     * 查询祝日管理列表
     */
    @RequiresPermissions("attendance:holiday:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(AttendanceHoliday attendanceHoliday) {
        startPage();
        List<AttendanceHoliday> list = attendanceHolidayService.selectAttendanceHolidayList(attendanceHoliday);
        return getDataTable(list);
    }

    /**
     * 导出祝日管理列表
     */
    @RequiresPermissions("attendance:holiday:import")
    @Log(title = "祝日管理", businessType = BusinessType.IMPORT)
    @PostMapping("/import")
    @ResponseBody
    public AjaxResult export() {
        /*List<AttendanceHoliday> list = attendanceHolidayService.selectAttendanceHolidayList(attendanceHoliday);
        ExcelUtil<AttendanceHoliday> util = new ExcelUtil<AttendanceHoliday>(AttendanceHoliday.class);
        return util.exportExcel(list, "祝日管理数据");*/
        return toAjax(attendanceHolidayService.batchInsertHoliday());
    }

    /**
     * 新增祝日管理
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存祝日管理
     */
    @RequiresPermissions("attendance:holiday:add")
    @Log(title = "祝日管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(AttendanceHoliday attendanceHoliday) {
        return toAjax(attendanceHolidayService.insertAttendanceHoliday(attendanceHoliday));
    }

    /**
     * 修改祝日管理
     */
    @RequiresPermissions("attendance:holiday:edit")
    @GetMapping("/edit/{holidayId}")
    public String edit(@PathVariable("holidayId") Long holidayId, ModelMap mmap) {
        AttendanceHoliday attendanceHoliday = attendanceHolidayService.selectAttendanceHolidayByHolidayId(holidayId);
        mmap.put("attendanceHoliday", attendanceHoliday);
        return prefix + "/edit";
    }

    /**
     * 修改保存祝日管理
     */
    @RequiresPermissions("attendance:holiday:edit")
    @Log(title = "祝日管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(AttendanceHoliday attendanceHoliday) {
        return toAjax(attendanceHolidayService.updateAttendanceHoliday(attendanceHoliday));
    }

    /**
     * 删除祝日管理
     */
    @RequiresPermissions("attendance:holiday:remove")
    @Log(title = "祝日管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(attendanceHolidayService.deleteAttendanceHolidayByHolidayIds(ids));
    }
}
