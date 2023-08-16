-- ----------------------------
-- 1�A�����Ζ��\
-- ----------------------------

drop table if exists attendance;
create table attendance_info (
attendance_id     bigint(20)       not null auto_increment  comment '�Ζ�ID',
employee_id       bigint(20)       not null                 comment '�Ζ�ID',
date              datetime         not null                 comment '�X�P�W���[�����O���t',
opening           datetime                                  comment '�n�Ǝ���',
closing           datetime                                  comment '�I�Ǝ���',
rest              decimal                                   comment '�x�e����',
week              varchar          not null                 comment '�j��',
is_attendance     int                                       comment '�o�Ѝݑ�(0�o��1�ݑ�)',
actual_work       decimal                                   comment '��������',
date_type         int                                       comment '���t�e�[�v(0����1�x���Q�j��)',
holiday_name      varchar                                   comment '�j����',
sent_flag         int                                       comment '�o�^�i 0���o�^1�o�^�j',
is_complete		  int	                                    comment '�����i0������1�����j',		
primary key (attendance_id)
) engine=innodb auto_increment=1 comment = '�����Ζ��\';


-- ----------------------------
-- 2�A�Ζ���ԕ\
-- ----------------------------

drop table if exists attendance_type;
create table attendance_type (
att_type_id       bigint(20)       not null auto_increment  comment '�Ζ���ԕ\ID',
attendance_id     bigint(20)       not null                 comment '�Ζ�ID',
code              int              default '0'              comment '0����1�x��2����3����4�a��5�L���x�� 6�U�֋x'
)

-- ----------------------------
-- 3�A�j���\
-- ----------------------------
drop table if exists sys_holiday;
create table holiday (
holiday_id        bigint(20)       not null                 comment '�j��ID',
holiday           date             not null                 comment '�j��',
holiday_name      varchar          not null                 comment '�j����'
)

-- ----------------------------
-- 4�A�������Z�\
-- ----------------------------
drop table if exists attendance_accounts;
create table attendance_accounts (
accounts_id       bigint(20)       not null auto_increment  comment '�v�ZID',
employee_id		  bigint(20)       not null  	            comment '�Ј�ID',		
attendance_day	  int	                                    comment '�o�Γ���',		
total_hour		  decimal	                                comment '�A�Ǝ���',		
night_overtime	  decimal	                                comment '�[��c��',		
rest_overtime	  decimal	                                comment '�x���c��',			
overtime		  decimal	                                comment '�c��',		
attendance_count  int	                                    comment '�o�Γ���',		
adjust_vacation	  int	                                    comment '�U�֋x',		
late		      decimal	                                comment '�x��',		
leave_early		  decimal	                                comment '����',			
absenteeism		  decimal	                                comment '����',		
sick_leave		  decimal	                                comment '�a��',		
paid_time_off     int	                                    comment '�L���x��',		
create_time		  datetime	                                comment '�쐬����',		
creater		      varchar	                                comment '�쐬��',		
del_flag       	  int	                                    comment '�폜�t���O�i0���� 2�폜�j',		
is_final          int	                                    comment '���Z�i 0�����Z1���Z�j'		
) engine=innodb auto_increment=1 comment = '�������Z�\';


-- ----------------------------
-- 5�A�Ј����\
-- ----------------------------
drop table if exists sys_employee;


