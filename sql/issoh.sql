-- ----------------------------
-- 1�A�Ζ����ѕ\
-- ----------------------------

drop table if exists attendance;
create table attendance (
attendance_id     bigint(20)       not null auto_increment  comment '�Ζ�ID',
employee_id       bigint(20)       not null                 comment '�Ζ�ID',
date              datetime         not null                 comment '�X�P�W���[�����O���t',
opening           datetime                                  comment '�n�Ǝ���',
closing           datetime                                  comment '�I�Ǝ���',
rest              double                                    comment '�x�e����',
week              varchar          not null                 comment '�j��',
is_attendance     int                                       comment '�o�Ѝݑ�(0�o��1�ݑ�)',
actual_work       double                                    comment '��������',
date_type         int                                       comment '���t�e�[�v(0����1�x���Q�j��)',
holiday_name      varchar                                   comment '�j����',
sent_flag         int                                       comment '�o�^�i 0���o�^1�o�^�j',
primary key (dept_id)
) engine=innodb auto_increment=200 comment = '����\';


-- ----------------------------
-- 2�A�Ζ���ԕ\
-- ----------------------------

drop table if exists attendance_type;
create table attendance_type (
attendance_id     bigint(20)       not null                 comment '�Ζ�ID',
code              int              not null                 comment '0����1�x��2����3����4�a��5�L���x�� 6�U�֋x'
)

-- ----------------------------
-- 3�A�j���\
-- ----------------------------
drop table if exists holiday;
create table holiday (
holiday_id        bigint(20)       not null                 comment '�j��ID',
holiday           date             not null                 comment '�j��',
holiday_name      varchar          not null                 comment '�j����'
)

-- ----------------------------
-- 4�A�������Z�\
-- ----------------------------
drop table if exists holiday;
create table holiday (
holiday_id        bigint(20)       not null                 comment '�j��ID',
holiday           date             not null                 comment '�j��',
holiday_name      varchar          not null                 comment '�j����'
)
