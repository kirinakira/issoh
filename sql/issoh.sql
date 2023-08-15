-- ----------------------------
-- 1AÎ±ÀÑ\
-- ----------------------------

drop table if exists attendance;
create table attendance (
attendance_id     bigint(20)       not null auto_increment  comment 'Î±ID',
employee_id       bigint(20)       not null                 comment 'Î±ID',
date              datetime         not null                 comment 'XPW[Oút',
opening           datetime                                  comment 'nÆÔ',
closing           datetime                                  comment 'IÆÔ',
rest              double                                    comment 'xeÔ',
week              varchar          not null                 comment 'jú',
is_attendance     int                                       comment 'oÐÝî(0oÐ1Ýî)',
actual_work       double                                    comment 'À­Ô',
date_type         int                                       comment 'úte[v(0½ú1xúQjú)',
holiday_name      varchar                                   comment 'jú¼',
sent_flag         int                                       comment 'o^i 0¢o^1o^j',
primary key (dept_id)
) engine=innodb auto_increment=200 comment = 'å\';


-- ----------------------------
-- 2AÎ±óÔ\
-- ----------------------------

drop table if exists attendance_type;
create table attendance_type (
attendance_id     bigint(20)       not null                 comment 'Î±ID',
code              int              not null                 comment '0³í1x2Þ3Î4a5LxÉ 6UÖx'
)

-- ----------------------------
-- 3Ajú\
-- ----------------------------
drop table if exists holiday;
create table holiday (
holiday_id        bigint(20)       not null                 comment 'júID',
holiday           date             not null                 comment 'jú',
holiday_name      varchar          not null                 comment 'jú¼'
)

-- ----------------------------
-- 4AZ\
-- ----------------------------
drop table if exists holiday;
create table holiday (
holiday_id        bigint(20)       not null                 comment 'júID',
holiday           date             not null                 comment 'jú',
holiday_name      varchar          not null                 comment 'jú¼'
)
