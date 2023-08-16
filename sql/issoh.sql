-- ----------------------------
-- 1AÎ±\
-- ----------------------------

drop table if exists attendance;
create table attendance_info (
attendance_id     bigint(20)       not null auto_increment  comment 'Î±ID',
employee_id       bigint(20)       not null                 comment 'Î±ID',
date              datetime         not null                 comment 'XPW[Oút',
opening           datetime                                  comment 'nÆÔ',
closing           datetime                                  comment 'IÆÔ',
rest              decimal                                   comment 'xeÔ',
week              varchar          not null                 comment 'jú',
is_attendance     int                                       comment 'oÐÝî(0oÐ1Ýî)',
actual_work       decimal                                   comment 'À­Ô',
date_type         int                                       comment 'úte[v(0½ú1xúQjú)',
holiday_name      varchar                                   comment 'jú¼',
sent_flag         int                                       comment 'o^i 0¢o^1o^j',
is_complete		  int	                                    comment '®¬i0¢®¬1®¬j',		
primary key (attendance_id)
) engine=innodb auto_increment=1 comment = 'Î±\';


-- ----------------------------
-- 2AÎ±óÔ\
-- ----------------------------

drop table if exists attendance_type;
create table attendance_type (
att_type_id       bigint(20)       not null auto_increment  comment 'Î±óÔ\ID',
attendance_id     bigint(20)       not null                 comment 'Î±ID',
code              int              default '0'              comment '0³í1x2Þ3Î4a5LxÉ 6UÖx'
)

-- ----------------------------
-- 3Ajú\
-- ----------------------------
drop table if exists sys_holiday;
create table holiday (
holiday_id        bigint(20)       not null                 comment 'júID',
holiday           date             not null                 comment 'jú',
holiday_name      varchar          not null                 comment 'jú¼'
)

-- ----------------------------
-- 4AZ\
-- ----------------------------
drop table if exists attendance_accounts;
create table attendance_accounts (
accounts_id       bigint(20)       not null auto_increment  comment 'vZID',
employee_id		  bigint(20)       not null  	            comment 'ÐõID',		
attendance_day	  int	                                    comment 'oÎú',		
total_hour		  decimal	                                comment 'AÆÔ',		
night_overtime	  decimal	                                comment '[écÆ',		
rest_overtime	  decimal	                                comment 'xúcÆ',			
overtime		  decimal	                                comment 'cÆ',		
attendance_count  int	                                    comment 'oÎú',		
adjust_vacation	  int	                                    comment 'UÖx',		
late		      decimal	                                comment 'x',		
leave_early		  decimal	                                comment 'Þ',			
absenteeism		  decimal	                                comment 'Î',		
sick_leave		  decimal	                                comment 'a',		
paid_time_off     int	                                    comment 'LxÉ',		
create_time		  datetime	                                comment 'ì¬Ô',		
creater		      varchar	                                comment 'ì¬Ò',		
del_flag       	  int	                                    comment 'ítOi0³í 2íj',		
is_final          int	                                    comment 'Zi 0¢Z1Zj'		
) engine=innodb auto_increment=1 comment = 'Z\';


-- ----------------------------
-- 5AÐõîñ\
-- ----------------------------
drop table if exists sys_employee;


