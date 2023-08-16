-- ----------------------------
-- 1AŒŸ‹Î–±•\
-- ----------------------------

drop table if exists attendance;
create table attendance_info (
attendance_id     bigint(20)       not null auto_increment  comment '‹Î–±ID',
employee_id       bigint(20)       not null                 comment '‹Î–±ID',
date              datetime         not null                 comment 'ƒXƒPƒWƒ…[ƒŠƒ“ƒO“ú•t',
opening           datetime                                  comment 'n‹ÆŠÔ',
closing           datetime                                  comment 'I‹ÆŠÔ',
rest              decimal                                   comment '‹xŒeŠÔ',
week              varchar          not null                 comment '—j“ú',
is_attendance     int                                       comment 'oĞİ‘î(0oĞ1İ‘î)',
actual_work       decimal                                   comment 'À“­ŠÔ',
date_type         int                                       comment '“ú•tƒe[ƒv(0•½“ú1‹x“ú‚Qj“ú)',
holiday_name      varchar                                   comment 'j“ú–¼',
sent_flag         int                                       comment '“o˜^i 0–¢“o˜^1“o˜^j',
is_complete		  int	                                    comment 'Š®¬i0–¢Š®¬1Š®¬j',		
primary key (attendance_id)
) engine=innodb auto_increment=1 comment = 'ŒŸ‹Î–±•\';


-- ----------------------------
-- 2A‹Î–±ó‘Ô•\
-- ----------------------------

drop table if exists attendance_type;
create table attendance_type (
att_type_id       bigint(20)       not null auto_increment  comment '‹Î–±ó‘Ô•\ID',
attendance_id     bigint(20)       not null                 comment '‹Î–±ID',
code              int              default '0'              comment '0³í1’x2‘‘Ş3Œ‡‹Î4•aŒ‡5—L‹‹‹x‰É 6U‘Ö‹x'
)

-- ----------------------------
-- 3Aj“ú•\
-- ----------------------------
drop table if exists sys_holiday;
create table holiday (
holiday_id        bigint(20)       not null                 comment 'j“úID',
holiday           date             not null                 comment 'j“ú',
holiday_name      varchar          not null                 comment 'j“ú–¼'
)

-- ----------------------------
-- 4AŒŸŒˆZ•\
-- ----------------------------
drop table if exists attendance_accounts;
create table attendance_accounts (
accounts_id       bigint(20)       not null auto_increment  comment 'ŒvZID',
employee_id		  bigint(20)       not null  	            comment 'ĞˆõID',		
attendance_day	  int	                                    comment 'o‹Î“ú”',		
total_hour		  decimal	                                comment 'A‹ÆŠÔ',		
night_overtime	  decimal	                                comment '[–éc‹Æ',		
rest_overtime	  decimal	                                comment '‹x“úc‹Æ',			
overtime		  decimal	                                comment 'c‹Æ',		
attendance_count  int	                                    comment 'o‹Î“úŸ',		
adjust_vacation	  int	                                    comment 'U‘Ö‹x',		
late		      decimal	                                comment '’x',		
leave_early		  decimal	                                comment '‘‘Ş',			
absenteeism		  decimal	                                comment 'Œ‡‹Î',		
sick_leave		  decimal	                                comment '•aŒ‡',		
paid_time_off     int	                                    comment '—L‹‹‹x‰É',		
create_time		  datetime	                                comment 'ì¬ŠÔ',		
creater		      varchar	                                comment 'ì¬Ò',		
del_flag       	  int	                                    comment 'íœƒtƒ‰ƒOi0³í 2íœj',		
is_final          int	                                    comment 'ŒˆZi 0–¢ŒˆZ1ŒˆZj'		
) engine=innodb auto_increment=1 comment = 'ŒŸŒˆZ•\';


-- ----------------------------
-- 5AĞˆõî•ñ•\
-- ----------------------------
drop table if exists sys_employee;


