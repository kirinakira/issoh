-- ----------------------------
-- 1A‹Î–±ÀÑ•\
-- ----------------------------

drop table if exists attendance;
create table attendance (
attendance_id     bigint(20)       not null auto_increment  comment '‹Î–±ID',
employee_id       bigint(20)       not null                 comment '‹Î–±ID',
date              datetime         not null                 comment 'ƒXƒPƒWƒ…[ƒŠƒ“ƒO“ú•t',
opening           datetime                                  comment 'n‹ÆŠÔ',
closing           datetime                                  comment 'I‹ÆŠÔ',
rest              double                                    comment '‹xŒeŠÔ',
week              varchar          not null                 comment '—j“ú',
is_attendance     int                                       comment 'oĞİ‘î(0oĞ1İ‘î)',
actual_work       double                                    comment 'À“­ŠÔ',
date_type         int                                       comment '“ú•tƒe[ƒv(0•½“ú1‹x“ú‚Qj“ú)',
holiday_name      varchar                                   comment 'j“ú–¼',
sent_flag         int                                       comment '“o˜^i 0–¢“o˜^1“o˜^j',
primary key (dept_id)
) engine=innodb auto_increment=200 comment = '•”–å•\';


-- ----------------------------
-- 2A‹Î–±ó‘Ô•\
-- ----------------------------

drop table if exists attendance_type;
create table attendance_type (
attendance_id     bigint(20)       not null                 comment '‹Î–±ID',
code              int              not null                 comment '0³í1’x2‘‘Ş3Œ‡‹Î4•aŒ‡5—L‹‹‹x‰É 6U‘Ö‹x'
)

-- ----------------------------
-- 3Aj“ú•\
-- ----------------------------
drop table if exists holiday;
create table holiday (
holiday_id        bigint(20)       not null                 comment 'j“úID',
holiday           date             not null                 comment 'j“ú',
holiday_name      varchar          not null                 comment 'j“ú–¼'
)

-- ----------------------------
-- 4AŒŸŒˆZ•\
-- ----------------------------
drop table if exists holiday;
create table holiday (
holiday_id        bigint(20)       not null                 comment 'j“úID',
holiday           date             not null                 comment 'j“ú',
holiday_name      varchar          not null                 comment 'j“ú–¼'
)
