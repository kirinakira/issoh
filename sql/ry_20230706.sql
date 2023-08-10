-- ----------------------------
-- 1、部門表
-- ----------------------------
drop table if exists sys_dept;
create table sys_dept (
  dept_id           bigint(20)      not null auto_increment    comment '部門ID',
  parent_id         bigint(20)      default 0                  comment '親部門ID',
  ancestors         varchar(50)     default ''                 comment '祖タブ',
  dept_name         varchar(30)     default ''                 comment '部門名前',
  order_num         int(4)          default 0                  comment '順番',
  leader            varchar(256)    default null               comment 'レーダー',
  phone             varchar(11)     default null               comment '携帯電話',
  email             varchar(50)     default null               comment 'メールアドレス',
  status            char(1)         default '0'                comment '部門状態（0正常 1禁止）',
  del_flag          char(1)         default '0'                comment '論理削除フラグ（0存在 2削除）',
  create_by         varchar(64)     default ''                 comment '作成者',
  create_time 	    datetime                                   comment '作成時間',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新時間',
  primary key (dept_id)
) engine=innodb auto_increment=200 comment = '部門表';

-- ----------------------------
-- 初期化-部門表
-- ----------------------------
insert into sys_dept values(100,  0,   '0','一創',   0, '一創', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(101,  100, '0,100','オフィス', 1, '一創', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(102,  100, '0,100','開発部', 2, '一創', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(103,  101, '0,100,101','開発部',   1, '一創', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(104,  101, '0,100,101','開発部',   2, '一創', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(105,  101, '0,100,101','開発部',   3, '一創', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(106,  101, '0,100,101','開発部',   4, '一創', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(107,  101, '0,100,101','開発部',   5, '一創', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(108,  102, '0,100,102','開発部',   1, '一創', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(109,  102, '0,100,102','開発部',   2, '一創', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);


-- ----------------------------
-- 2、ユーザ表
-- ----------------------------
drop table if exists sys_user;
create table sys_user (
  user_id           bigint(20)      not null auto_increment    comment 'ユーザID',
  dept_id           bigint(20)      default null               comment '部門ID',
  login_name        varchar(30)     not null                   comment 'アカウント名',
  user_name         varchar(30)     default ''                 comment 'ニックネーム',
  user_type         varchar(2)      default '00'               comment 'ユーザテープ（00管理者 01会社員）',
  email             varchar(50)     default ''                 comment 'メールアドレス',
  phonenumber       varchar(11)     default ''                 comment '携帯電話',
  sex               char(1)         default '0'                comment '性別（0男 1女　2未知 ）',
  avatar            varchar(100)    default ''                 comment '顔写真',
  password          varchar(50)     default ''                 comment 'パスワード：',
  salt              varchar(20)     default ''                 comment '暗号化',
  status            char(1)         default '0'                comment 'アカウント状態（0正常 1禁止）',
  del_flag          char(1)         default '0'                comment '論理削除フラグ（0存在 2削除）',
  login_ip          varchar(128)    default ''                 comment '最後登録IP',
  login_date        datetime                                   comment '最後登録時間',
  pwd_update_date   datetime                                   comment 'パスワード最後更新時間',
  create_by         varchar(64)     default ''                 comment '作成者',
  create_time       datetime                                   comment '作成時間',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新時間',
  remark            varchar(500)    default null               comment '備考',
  primary key (user_id)
) engine=innodb auto_increment=100 comment = 'ユーザ表';

-- ----------------------------
-- 初期化-ユーザ表
-- ----------------------------
insert into sys_user values(1,  103, 'admin', '一創', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', sysdate(), sysdate(), 'admin', sysdate(), '', null, '管理者');
insert into sys_user values(2,  105, 'ry',    '一創', '00', 'ry@qq.com',  '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', sysdate(), sysdate(), 'admin', sysdate(), '', null, 'テスト');


-- ----------------------------
-- 3、部署表
-- ----------------------------
drop table if exists sys_post;
create table sys_post
(
  post_id       bigint(20)      not null auto_increment    comment '部署ID',
  post_code     varchar(64)     not null                   comment '部署CD',
  post_name     varchar(50)     not null                   comment '部署名',
  post_sort     int(4)          not null                   comment '順番',
  status        char(1)         not null                   comment '状態（0正常 1禁止）',
  create_by     varchar(64)     default ''                 comment '作成者',
  create_time   datetime                                   comment '作成時間',
  update_by     varchar(64)     default ''			       comment '更新者',
  update_time   datetime                                   comment '更新時間',
  remark        varchar(500)    default null               comment '備考',
  primary key (post_id)
) engine=innodb comment = '部署表';

-- ----------------------------
-- 初期化-部署表
-- ----------------------------
insert into sys_post values(1, 'ceo',  '社長',    1, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(2, 'se',   'PM',  2, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(3, 'hr',   '人事',  3, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(4, 'user', '社員',  4, '0', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 4、ロール表
-- ----------------------------
drop table if exists sys_role;
create table sys_role (
  role_id           bigint(20)      not null auto_increment    comment 'ロールID',
  role_name         varchar(30)     not null                   comment 'ロール名',
  role_key          varchar(100)    not null                   comment 'ロール権限キー',
  role_sort         int(4)          not null                   comment '順番',
  data_scope        char(1)         default '1'                comment '権限範囲（1:全部 2:カスタム 3:部門権限 4:部門）',
  status            char(1)         not null                   comment '状態（0正常 1禁止）',
  del_flag          char(1)         default '0'                comment '論理削除フラグ（0存在 2削除）',
  create_by         varchar(64)     default ''                 comment '作成者',
  create_time       datetime                                   comment '作成時間',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新時間',
  remark            varchar(500)    default null               comment '備考',
  primary key (role_id)
) engine=innodb auto_increment=100 comment = 'ロール表';

-- ----------------------------
-- 初期化-ロール表
-- ----------------------------
insert into sys_role values('1', 'スーパー管理者', 'admin',  1, 1, '0', '0', 'admin', sysdate(), '', null, 'スーパー管理者');
insert into sys_role values('2', '社員',   'common', 2, 2, '0', '0', 'admin', sysdate(), '', null, '社員');


-- ----------------------------
-- 5、メニュー権限表
-- ----------------------------
drop table if exists sys_menu;
create table sys_menu (
  menu_id           bigint(20)      not null auto_increment    comment 'メニューID',
  menu_name         varchar(50)     not null                   comment 'メニュー名',
  parent_id         bigint(20)      default 0                  comment '親メニューID',
  order_num         int(4)          default 0                  comment '順番',
  url               varchar(200)    default '#'                comment 'リクエストアドレス',
  target            varchar(20)     default ''                 comment 'やり方（menuItemページラベル menuBlank新ウィンドウ）',
  menu_type         char(1)         default ''                 comment 'メニュー種類（M目録 Cメニュー Fボタン）',
  visible           char(1)         default 0                  comment 'メニュー状態（0表示 1非表示）',
  is_refresh        char(1)         default 1                  comment '刷新状態（0刷新 1不刷新）',
  perms             varchar(100)    default null               comment '権限マーク',
  icon              varchar(100)    default '#'                comment 'メニューアイコン',
  create_by         varchar(64)     default ''                 comment '作成者',
  create_time       datetime                                   comment '作成時間',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新時間',
  remark            varchar(500)    default ''                 comment '備考',
  primary key (menu_id)
) engine=innodb auto_increment=2000 comment = 'メニュー権限表';

-- ----------------------------
-- 初期化-メニュー表
-- ----------------------------
-- メニューレベル1
insert into sys_menu values('1', 'システム管理', '0', '1', '#',                '',          'M', '0', '1', '', 'fa fa-gear',           'admin', sysdate(), '', null, 'システム管理');
insert into sys_menu values('2', 'システム監視', '0', '2', '#',                '',          'M', '0', '1', '', 'fa fa-video-camera',   'admin', sysdate(), '', null, 'システム監視');
insert into sys_menu values('3', 'システムツール', '0', '3', '#',                '',          'M', '0', '1', '', 'fa fa-bars',           'admin', sysdate(), '', null, 'システムツール');
insert into sys_menu values('4', 'ホームページ', '0', '4', 'https://www.issoh.co.jp/wp/ja/', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', sysdate(), '', null, '一創ホームページ');
-- メニューレベル２
insert into sys_menu values('100',  'ユーザ管理', '1', '1', '/system/user',          '', 'C', '0', '1', 'system:user:view',         'fa fa-user-o',          'admin', sysdate(), '', null, 'ユーザ管理メニュー');
insert into sys_menu values('101',  'ロール管理', '1', '2', '/system/role',          '', 'C', '0', '1', 'system:role:view',         'fa fa-user-secret',     'admin', sysdate(), '', null, 'ロール管理メニュー');
insert into sys_menu values('102',  'メニュー管理', '1', '3', '/system/menu',          '', 'C', '0', '1', 'system:menu:view',         'fa fa-th-list',         'admin', sysdate(), '', null, 'メニュー管理');
insert into sys_menu values('103',  '部門管理', '1', '4', '/system/dept',          '', 'C', '0', '1', 'system:dept:view',         'fa fa-outdent',         'admin', sysdate(), '', null, '部門管理メニュー');
insert into sys_menu values('104',  '部署管理', '1', '5', '/system/post',          '', 'C', '0', '1', 'system:post:view',         'fa fa-address-card-o',  'admin', sysdate(), '', null, '部署管理メニュー');
insert into sys_menu values('105',  'データ辞書', '1', '6', '/system/dict',          '', 'C', '0', '1', 'system:dict:view',         'fa fa-bookmark-o',      'admin', sysdate(), '', null, 'データ辞書');
insert into sys_menu values('106',  'パラメータ設定', '1', '7', '/system/config',        '', 'C', '0', '1', 'system:config:view',       'fa fa-sun-o',           'admin', sysdate(), '', null, 'パラメータ設定');
insert into sys_menu values('107',  '通知', '1', '8', '/system/notice',        '', 'C', '0', '1', 'system:notice:view',       'fa fa-bullhorn',        'admin', sysdate(), '', null, '通知');
insert into sys_menu values('108',  'ログ管理', '1', '9', '#',                     '', 'M', '0', '1', '',                         'fa fa-pencil-square-o', 'admin', sysdate(), '', null, 'ログ管理');
insert into sys_menu values('109',  'オンラインユーザ', '2', '1', '/monitor/online',       '', 'C', '0', '1', 'monitor:online:view',      'fa fa-user-circle',     'admin', sysdate(), '', null, 'オンラインユーザ');
insert into sys_menu values('110',  'タスク', '2', '2', '/monitor/job',          '', 'C', '0', '1', 'monitor:job:view',         'fa fa-tasks',           'admin', sysdate(), '', null, 'タスク');
insert into sys_menu values('111',  'データ監視', '2', '3', '/monitor/data',         '', 'C', '0', '1', 'monitor:data:view',        'fa fa-bug',             'admin', sysdate(), '', null, 'データ監視');
insert into sys_menu values('112',  'サービス監視', '2', '4', '/monitor/server',       '', 'C', '0', '1', 'monitor:server:view',      'fa fa-server',          'admin', sysdate(), '', null, 'サービス監視');
insert into sys_menu values('113',  'キャッシュ監視', '2', '5', '/monitor/cache',        '', 'C', '0', '1', 'monitor:cache:view',       'fa fa-cube',            'admin', sysdate(), '', null, 'キャッシュ監視　');
insert into sys_menu values('114',  'フォーム作成', '3', '1', '/tool/build',           '', 'C', '0', '1', 'tool:build:view',          'fa fa-wpforms',         'admin', sysdate(), '', null, 'フォーム作成');
insert into sys_menu values('115',  'コード作成', '3', '2', '/tool/gen',             '', 'C', '0', '1', 'tool:gen:view',            'fa fa-code',            'admin', sysdate(), '', null, 'コード作成');
insert into sys_menu values('116',  'インタフェース', '3', '3', '/tool/swagger',         '', 'C', '0', '1', 'tool:swagger:view',        'fa fa-gg',              'admin', sysdate(), '', null, 'インタフェース');
-- メニューレベル３
insert into sys_menu values('500',  '操作ログ', '108', '1', '/monitor/operlog',    '', 'C', '0', '1', 'monitor:operlog:view',     'fa fa-address-book',    'admin', sysdate(), '', null, '操作ログ');
insert into sys_menu values('501',  '登録ログ', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view',  'fa fa-file-image-o',    'admin', sysdate(), '', null, '登録ログ');
-- ユーザ管理ボタン
insert into sys_menu values('1000', 'ユーザ検索', '100', '1',  '#', '',  'F', '0', '1', 'system:user:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1001', 'ユーザ作成', '100', '2',  '#', '',  'F', '0', '1', 'system:user:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1002', 'ユーザ更新', '100', '3',  '#', '',  'F', '0', '1', 'system:user:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1003', 'ユーザ削除', '100', '4',  '#', '',  'F', '0', '1', 'system:user:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1004', 'ユーザエクスポート', '100', '5',  '#', '',  'F', '0', '1', 'system:user:export',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1005', 'ユーザインポート', '100', '6',  '#', '',  'F', '0', '1', 'system:user:import',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1006', 'パスワードリセット', '100', '7',  '#', '',  'F', '0', '1', 'system:user:resetPwd',    '#', 'admin', sysdate(), '', null, '');
-- 角色管理按钮
insert into sys_menu values('1007', 'ロール検索', '101', '1',  '#', '',  'F', '0', '1', 'system:role:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1008', 'ロール作成', '101', '2',  '#', '',  'F', '0', '1', 'system:role:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1009', 'ロール更新', '101', '3',  '#', '',  'F', '0', '1', 'system:role:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1010', 'ロール削除', '101', '4',  '#', '',  'F', '0', '1', 'system:role:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1011', 'ロールエクスポート', '101', '5',  '#', '',  'F', '0', '1', 'system:role:export',      '#', 'admin', sysdate(), '', null, '');
-- 菜单管理按钮
insert into sys_menu values('1012', 'メニュー検索', '102', '1',  '#', '',  'F', '0', '1', 'system:menu:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1013', 'メニュー作成', '102', '2',  '#', '',  'F', '0', '1', 'system:menu:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1014', 'メニュー更新', '102', '3',  '#', '',  'F', '0', '1', 'system:menu:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1015', 'メニュー削除', '102', '4',  '#', '',  'F', '0', '1', 'system:menu:remove',      '#', 'admin', sysdate(), '', null, '');
-- 部门管理按钮
insert into sys_menu values('1016', '部門検索', '103', '1',  '#', '',  'F', '0', '1', 'system:dept:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1017', '部門作成', '103', '2',  '#', '',  'F', '0', '1', 'system:dept:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1018', '部門更新', '103', '3',  '#', '',  'F', '0', '1', 'system:dept:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1019', '部門削除', '103', '4',  '#', '',  'F', '0', '1', 'system:dept:remove',      '#', 'admin', sysdate(), '', null, '');
-- 岗位管理按钮
insert into sys_menu values('1020', '部署検索', '104', '1',  '#', '',  'F', '0', '1', 'system:post:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1021', '部署作成', '104', '2',  '#', '',  'F', '0', '1', 'system:post:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1022', '部署更新', '104', '3',  '#', '',  'F', '0', '1', 'system:post:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1023', '部署削除', '104', '4',  '#', '',  'F', '0', '1', 'system:post:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1024', '部署エクスポート', '104', '5',  '#', '',  'F', '0', '1', 'system:post:export',      '#', 'admin', sysdate(), '', null, '');
-- 字典管理按钮
insert into sys_menu values('1025', '辞書検索', '105', '1',  '#', '',  'F', '0', '1', 'system:dict:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1026', '辞書作成', '105', '2',  '#', '',  'F', '0', '1', 'system:dict:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1027', '辞書更新', '105', '3',  '#', '',  'F', '0', '1', 'system:dict:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1028', '辞書削除', '105', '4',  '#', '',  'F', '0', '1', 'system:dict:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1029', '辞書エクスポート', '105', '5',  '#', '',  'F', '0', '1', 'system:dict:export',      '#', 'admin', sysdate(), '', null, '');
-- 参数设置按钮
insert into sys_menu values('1030', 'パラメータ検索', '106', '1',  '#', '',  'F', '0', '1', 'system:config:list',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1031', 'パラメータ作成', '106', '2',  '#', '',  'F', '0', '1', 'system:config:add',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1032', 'パラメータ更新', '106', '3',  '#', '',  'F', '0', '1', 'system:config:edit',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1033', 'パラメータ削除', '106', '4',  '#', '',  'F', '0', '1', 'system:config:remove',    '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1034', 'パラメータエクスポート', '106', '5',  '#', '',  'F', '0', '1', 'system:config:export',    '#', 'admin', sysdate(), '', null, '');
-- 通知公告按钮
insert into sys_menu values('1035', '通知検索', '107', '1',  '#', '',  'F', '0', '1', 'system:notice:list',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1036', '通知作成', '107', '2',  '#', '',  'F', '0', '1', 'system:notice:add',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1037', '通知更新', '107', '3',  '#', '',  'F', '0', '1', 'system:notice:edit',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1038', '通知削除', '107', '4',  '#', '',  'F', '0', '1', 'system:notice:remove',    '#', 'admin', sysdate(), '', null, '');
-- 操作日志按钮
insert into sys_menu values('1039', '操作検索', '500', '1',  '#', '',  'F', '0', '1', 'monitor:operlog:list',    '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1040', '操作作成', '500', '2',  '#', '',  'F', '0', '1', 'monitor:operlog:remove',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1041', '詳細情報', '500', '3',  '#', '',  'F', '0', '1', 'monitor:operlog:detail',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1042', 'ログエクスポ', '500', '4',  '#', '',  'F', '0', '1', 'monitor:operlog:export',  '#', 'admin', sysdate(), '', null, '');
-- 登录日志按钮
insert into sys_menu values('1043', '登録検索', '501', '1',  '#', '',  'F', '0', '1', 'monitor:logininfor:list',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1044', '登録削除', '501', '2',  '#', '',  'F', '0', '1', 'monitor:logininfor:remove',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1045', 'ログエクスポ', '501', '3',  '#', '',  'F', '0', '1', 'monitor:logininfor:export',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1046', 'アカウントアンロック', '501', '4',  '#', '',  'F', '0', '1', 'monitor:logininfor:unlock',       '#', 'admin', sysdate(), '', null, '');
-- 在线用户按钮
insert into sys_menu values('1047', 'オンライン検索', '109', '1',  '#', '',  'F', '0', '1', 'monitor:online:list',             '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1048', 'バッチ強制終了', '109', '2',  '#', '',  'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1049', 'シングル強制終了', '109', '3',  '#', '',  'F', '0', '1', 'monitor:online:forceLogout',      '#', 'admin', sysdate(), '', null, '');
-- 定时任务按钮
insert into sys_menu values('1050', 'タスク検索', '110', '1',  '#', '',  'F', '0', '1', 'monitor:job:list',                '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1051', 'タスク作成', '110', '2',  '#', '',  'F', '0', '1', 'monitor:job:add',                 '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1052', 'タスク更新', '110', '3',  '#', '',  'F', '0', '1', 'monitor:job:edit',                '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1053', 'タスク削除', '110', '4',  '#', '',  'F', '0', '1', 'monitor:job:remove',              '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1054', '状態更新', '110', '5',  '#', '',  'F', '0', '1', 'monitor:job:changeStatus',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1055', 'タスク詳細', '110', '6',  '#', '',  'F', '0', '1', 'monitor:job:detail',              '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1056', 'タスクエクスポ', '110', '7',  '#', '',  'F', '0', '1', 'monitor:job:export',              '#', 'admin', sysdate(), '', null, '');
-- 代码生成按钮
insert into sys_menu values('1057', 'コード検索', '115', '1',  '#', '',  'F', '0', '1', 'tool:gen:list',     '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1058', 'コード更新', '115', '2',  '#', '',  'F', '0', '1', 'tool:gen:edit',     '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1059', 'コード削除', '115', '3',  '#', '',  'F', '0', '1', 'tool:gen:remove',   '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1060', 'コードプレビュー', '115', '4',  '#', '',  'F', '0', '1', 'tool:gen:preview',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1061', 'コード作成', '115', '5',  '#', '',  'F', '0', '1', 'tool:gen:code',     '#', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 6、用户和角色关联表  用户N-1角色
-- ----------------------------
drop table if exists sys_user_role;
create table sys_user_role (
  user_id   bigint(20) not null comment 'ユーザID',
  role_id   bigint(20) not null comment 'ロールID',
  primary key(user_id, role_id)
) engine=innodb comment = 'ユーザとロールの関連表';

-- ----------------------------
-- 初始化-用户和角色关联表数据
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');


-- ----------------------------
-- 7、角色和菜单关联表  角色1-N菜单
-- ----------------------------
drop table if exists sys_role_menu;
create table sys_role_menu (
  role_id   bigint(20) not null comment 'ユーザID',
  menu_id   bigint(20) not null comment 'メニューID',
  primary key(role_id, menu_id)
) engine=innodb comment = 'ユーザとメニューの関連表';

-- ----------------------------
-- 初始化-角色和菜单关联表数据
-- ----------------------------
insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '4');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '115');
insert into sys_role_menu values ('2', '116');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1049');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1051');
insert into sys_role_menu values ('2', '1052');
insert into sys_role_menu values ('2', '1053');
insert into sys_role_menu values ('2', '1054');
insert into sys_role_menu values ('2', '1055');
insert into sys_role_menu values ('2', '1056');
insert into sys_role_menu values ('2', '1057');
insert into sys_role_menu values ('2', '1058');
insert into sys_role_menu values ('2', '1059');
insert into sys_role_menu values ('2', '1060');
insert into sys_role_menu values ('2', '1061');

-- ----------------------------
-- 8、角色和部门关联表  角色1-N部门
-- ----------------------------
drop table if exists sys_role_dept;
create table sys_role_dept (
  role_id   bigint(20) not null comment 'ロールID',
  dept_id   bigint(20) not null comment '部門ID',
  primary key(role_id, dept_id)
) engine=innodb comment = 'ロールと部門の関連表';

-- ----------------------------
-- 初始化-角色和部门关联表数据
-- ----------------------------
insert into sys_role_dept values ('2', '100');
insert into sys_role_dept values ('2', '101');
insert into sys_role_dept values ('2', '105');

-- ----------------------------
-- 9、用户与岗位关联表  用户1-N岗位
-- ----------------------------
drop table if exists sys_user_post;
create table sys_user_post
(
  user_id   bigint(20) not null comment 'ユーザID',
  post_id   bigint(20) not null comment '部署ID',
  primary key (user_id, post_id)
) engine=innodb comment = 'ユーザと部署の関連表';

-- ----------------------------
-- 初始化-用户与岗位关联表数据
-- ----------------------------
insert into sys_user_post values ('1', '1');
insert into sys_user_post values ('2', '2');


-- ----------------------------
-- 10、操作日志记录
-- ----------------------------
drop table if exists sys_oper_log;
create table sys_oper_log (
  oper_id           bigint(20)      not null auto_increment    comment '操作PK',
  title             varchar(50)     default ''                 comment 'モジュール名',
  business_type     int(2)          default 0                  comment '業務種類（0その他 1作成 2更新 3削除）',
  method            varchar(100)    default ''                 comment 'メソッド名',
  request_method    varchar(10)     default ''                 comment 'リクエスメソッド',
  operator_type     int(1)          default 0                  comment '操作種類（0その他 1PC端末 2携帯端末）',
  oper_name         varchar(50)     default ''                 comment '操作者',
  dept_name         varchar(50)     default ''                 comment '部門名',
  oper_url          varchar(255)    default ''                 comment 'リクエスアドレス',
  oper_ip           varchar(128)    default ''                 comment '端末IP',
  oper_location     varchar(255)    default ''                 comment 'IP位置',
  oper_param        varchar(2000)   default ''                 comment 'リクエスパラメータ',
  json_result       varchar(2000)   default ''                 comment 'レスポンスパラメータ',
  status            int(1)          default 0                  comment '操作状態（0正常 1異常）',
  error_msg         varchar(2000)   default ''                 comment 'エラーメッセージ',
  oper_time         datetime                                   comment '操作時間',
  cost_time         bigint(20)      default 0                  comment '使用時間',
  primary key (oper_id),
  key idx_sys_oper_log_bt (business_type),
  key idx_sys_oper_log_s  (status),
  key idx_sys_oper_log_ot (oper_time)
) engine=innodb auto_increment=100 comment = '操作ログ';


-- ----------------------------
-- 11、辞書種類表
-- ----------------------------
drop table if exists sys_dict_type;
create table sys_dict_type
(
  dict_id          bigint(20)      not null auto_increment    comment '辞書PK',
  dict_name        varchar(100)    default ''                 comment '辞書名',
  dict_type        varchar(100)    default ''                 comment '辞書種類',
  status           char(1)         default '0'                comment '状態（0正常 1禁止）',
  create_by        varchar(64)     default ''                 comment '作成者',
  create_time      datetime                                   comment '作成時間',
  update_by        varchar(64)     default ''                 comment '更新者',
  update_time      datetime                                   comment '更新時間',
  remark           varchar(500)    default null               comment '備考',
  primary key (dict_id),
  unique (dict_type)
) engine=innodb auto_increment=100 comment = '辞書種類表';

insert into sys_dict_type values(1,  'ユーザ性別', 'sys_user_sex',        '0', 'admin', sysdate(), '', null, 'ユーザ性別');
insert into sys_dict_type values(2,  'メニュー状態', 'sys_show_hide',       '0', 'admin', sysdate(), '', null, 'メニュー状態');
insert into sys_dict_type values(3,  'システムスイッチ', 'sys_normal_disable',  '0', 'admin', sysdate(), '', null, 'システムスイッチ');
insert into sys_dict_type values(4,  'ジョブステータス', 'sys_job_status',      '0', 'admin', sysdate(), '', null, 'ジョブステータス');
insert into sys_dict_type values(5,  'ジョブグループ', 'sys_job_group',       '0', 'admin', sysdate(), '', null, 'ジョブグループ');
insert into sys_dict_type values(6,  'システム要否', 'sys_yes_no',          '0', 'admin', sysdate(), '', null, 'システム要否');
insert into sys_dict_type values(7,  '通知種類', 'sys_notice_type',     '0', 'admin', sysdate(), '', null, '通知種類');
insert into sys_dict_type values(8,  '通知状態', 'sys_notice_status',   '0', 'admin', sysdate(), '', null, '通知状態');
insert into sys_dict_type values(9,  '操作種類', 'sys_oper_type',       '0', 'admin', sysdate(), '', null, '操作種類');
insert into sys_dict_type values(10, 'システムステータス', 'sys_common_status',   '0', 'admin', sysdate(), '', null, '登録状態');


-- ----------------------------
-- 12、字典数据表
-- ----------------------------
drop table if exists sys_dict_data;
create table sys_dict_data
(
  dict_code        bigint(20)      not null auto_increment    comment '辞書CD',
  dict_sort        int(4)          default 0                  comment '順番',
  dict_label       varchar(100)    default ''                 comment 'ラベル',
  dict_value       varchar(100)    default ''                 comment '辞書の値',
  dict_type        varchar(100)    default ''                 comment '辞書種類',
  css_class        varchar(100)    default null               comment 'CSS',
  list_class       varchar(100)    default null               comment 'フォーム',
  is_default       char(1)         default 'N'                comment '要否黙認（Y，N）',
  status           char(1)         default '0'                comment '状態（0正常 1禁止）',
  create_by        varchar(64)     default ''                 comment '作成者',
  create_time      datetime                                   comment '作成時間',
  update_by        varchar(64)     default ''                 comment '更新者',
  update_time      datetime                                   comment '更新時間',
  remark           varchar(500)    default null               comment '備考',
  primary key (dict_code)
) engine=innodb auto_increment=100 comment = '辞書表';

insert into sys_dict_data values(1,  1,  '男',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 'admin', sysdate(), '', null, '男');
insert into sys_dict_data values(2,  2,  '女',       '1',       'sys_user_sex',        '',   '',        'N', '0', 'admin', sysdate(), '', null, '女');
insert into sys_dict_data values(3,  3,  '未知',     '2',       'sys_user_sex',        '',   '',        'N', '0', 'admin', sysdate(), '', null, '性別未知');
insert into sys_dict_data values(4,  1,  '表示',     '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'メニュー表示');
insert into sys_dict_data values(5,  2,  '不表示',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'メニュー不表示');
insert into sys_dict_data values(6,  1,  '正常',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '正常状態');
insert into sys_dict_data values(7,  2,  '禁止',     '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '禁止状態');
insert into sys_dict_data values(8,  1,  'らリング',     '0',       'sys_job_status',      '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'ジョブらリング');
insert into sys_dict_data values(9,  2,  'ポーズ',     '1',       'sys_job_status',      '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'ジョブポーズ');
insert into sys_dict_data values(10, 1,  '黙認',     'DEFAULT', 'sys_job_group',       '',   '',        'Y', '0', 'admin', sysdate(), '', null, '黙認グループ');
insert into sys_dict_data values(11, 2,  'システム',     'SYSTEM',  'sys_job_group',       '',   '',        'N', '0', 'admin', sysdate(), '', null, 'システムグループ');
insert into sys_dict_data values(12, 1,  'YES',       'Y',       'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'システム黙認YES');
insert into sys_dict_data values(13, 2,  'NO',       'N',       'sys_yes_no',          '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'システム黙認NO');
insert into sys_dict_data values(14, 1,  'ワーニング',     '1',       'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', sysdate(), '', null, 'ワーニング');
insert into sys_dict_data values(15, 2,  '成功',     '2',       'sys_notice_type',     '',   'success', 'N', '0', 'admin', sysdate(), '', null, '成功');
insert into sys_dict_data values(16, 1,  'オン',     '0',       'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'オン');
insert into sys_dict_data values(17, 2,  'オフ',     '1',       'sys_notice_status',   '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'オフ');
insert into sys_dict_data values(18, 99, 'その他',     '0',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, 'その他操作');
insert into sys_dict_data values(19, 1,  '作成',     '1',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, '作成操作');
insert into sys_dict_data values(20, 2,  '更新',     '2',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, '更新操作');
insert into sys_dict_data values(21, 3,  '削除',     '3',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '削除操作');
insert into sys_dict_data values(22, 4,  '授権',     '4',       'sys_oper_type',       '',   'primary', 'N', '0', 'admin', sysdate(), '', null, '授権操作');
insert into sys_dict_data values(23, 5,  'エクスポート',     '5',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, 'エクスポート操作');
insert into sys_dict_data values(24, 6,  'インポート',     '6',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, 'インポート操作　');
insert into sys_dict_data values(25, 7,  '強制終了',     '7',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '強制終了');
insert into sys_dict_data values(26, 8,  'コード作成', '8',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, 'コード作成');
insert into sys_dict_data values(27, 9,  'クリア', '9',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'コードクリア');
insert into sys_dict_data values(28, 1,  '成功',     '0',       'sys_common_status',   '',   'primary', 'N', '0', 'admin', sysdate(), '', null, '正常状態');
insert into sys_dict_data values(29, 2,  '失敗',     '1',       'sys_common_status',   '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '禁止状態');


-- ----------------------------
-- 13、参数配置表
-- ----------------------------
drop table if exists sys_config;
create table sys_config (
  config_id         int(5)          not null auto_increment    comment 'パラメータPK',
  config_name       varchar(100)    default ''                 comment 'パラメータ名',
  config_key        varchar(100)    default ''                 comment 'パラメータキー名',
  config_value      varchar(500)    default ''                 comment 'パラメータ値',
  config_type       char(1)         default 'N'                comment 'システム黙認（Y， N）',
  create_by         varchar(64)     default ''                 comment '作成者',
  create_time       datetime                                   comment '作成時間',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新時間',
  remark            varchar(500)    default null               comment '備考',
  primary key (config_id)
) engine=innodb auto_increment=100 comment = 'パラメータ表';

insert into sys_config values(1,  'システム-黙認テーマ',     'sys.index.skinName',               'skin-blue',     'Y', 'admin', sysdate(), '', null, '青色skin-blue、緑色skin-green、紫色skin-purple、赤色skin-red、黄色 skin-yellow');
insert into sys_config values(2,  'ユーザ管理-アカウント初期化パスワード',         'sys.user.initPassword',            '123456',        'Y', 'admin', sysdate(), '', null, '初期化パスワード 123456');
insert into sys_config values(3,  'システムインデックス-セットテーマ',           'sys.index.sideTheme',              'theme-dark',    'Y', 'admin', sysdate(), '', null, '黒色テーマtheme-dark，白色テーマtheme-light，青色テーマtheme-blue');
insert into sys_config values(4,  'アカウントレジェンドー要否黙認レジスター', 'sys.account.registerUser',         'false',         'Y', 'admin', sysdate(), '', null, '要否黙認レジスター（true黙認，false不黙認）');
insert into sys_config values(5,  'アカウント管理-パスワードルール',         'sys.account.chrtype',              '0',             'Y', 'admin', sysdate(), '', null, '黙認任意キャラクタ，0任意キャラクタ，1数字（0から9まで数字のみ），2英字（aからｚまで英字のみ），3英字と数字（数字と英字必ず含める）,4英字、数字と（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
insert into sys_config values(6,  'アカウント管理-パスワード初期化修正ルール',     'sys.account.initPasswordModify',   '0',             'Y', 'admin', sysdate(), '', null, '0:初期化修正禁止，提示がない，1：提示，初回登録の時、パスワード更新を提示します。');
insert into sys_config values(7,  'アカウント管理-パスワード更新周期',     'sys.account.passwordValidateDays', '0',             'Y', 'admin', sysdate(), '', null, 'パスワード更新周期（数字入力，黙認値は0、更新の場合、必ず0～365間の数字）');
insert into sys_config values(8,  'システム-メニューナビゲーション風格',     'sys.index.menuStyle',              'default',       'Y', 'admin', sysdate(), '', null, 'メニューナビゲーション風格（default左側ナビゲーション，topnavトープナビゲーション）');
insert into sys_config values(9,  'システム-表示フッター',         'sys.index.footer',                 'true',          'Y', 'admin', sysdate(), '', null, '表示フッター（true表示，false非表示）');
insert into sys_config values(10, 'システム-表示ページラベル',         'sys.index.tagsView',               'true',          'Y', 'admin', sysdate(), '', null, '表示ページラベル（true表示，false非表示）');
insert into sys_config values(11, 'ユーザ登録-ブラックリスト',           'sys.login.blackIPList',            '',              'Y', 'admin', sysdate(), '', null, 'ユーザ登録ブラックリストに設定，複数マッチングの場合、英字符号「;」区切り，（英字符号「*」、ネットワークセグメントもできる）');


-- ----------------------------
-- 14、系统访问记录
-- ----------------------------
drop table if exists sys_logininfor;
create table sys_logininfor (
  info_id        bigint(20)     not null auto_increment   comment '登録ID',
  login_name     varchar(50)    default ''                comment '登録アカウント',
  ipaddr         varchar(128)   default ''                comment '登録IP',
  login_location varchar(255)   default ''                comment '登録位置',
  browser        varchar(50)    default ''                comment 'ブラウザ',
  os             varchar(50)    default ''                comment 'システムOS',
  status         char(1)        default '0'               comment '登録状態（0成功 1失敗）',
  msg            varchar(255)   default ''                comment 'メッセージ',
  login_time     datetime                                 comment '登録時間',
  primary key (info_id),
  key idx_sys_logininfor_s  (status),
  key idx_sys_logininfor_lt (login_time)
) engine=innodb auto_increment=100 comment = 'システム登録ログ';


-- ----------------------------
-- 15、在线用户记录
-- ----------------------------
drop table if exists sys_user_online;
create table sys_user_online (
  sessionId         varchar(50)   default ''                comment 'セッションid',
  login_name        varchar(50)   default ''                comment '登録アカウント',
  dept_name         varchar(50)   default ''                comment '部門名',
  ipaddr            varchar(128)  default ''                comment '登録IP',
  login_location    varchar(255)  default ''                comment '登録位置',
  browser           varchar(50)   default ''                comment 'ブラウザ',
  os                varchar(50)   default ''                comment 'システムOS',
  status            varchar(10)   default ''                comment 'オンライン状態（on_lineオンラインoff_lineオフライン）',
  start_timestamp   datetime                                comment 'セッション時間',
  last_access_time  datetime                                comment 'セッション最後アクセス時間',
  expire_time       int(5)        default 0                 comment 'タイムアウト',
  primary key (sessionId)
) engine=innodb comment = 'オンラインログ';


-- ----------------------------
-- 16、定时任务调度表
-- ----------------------------
drop table if exists sys_job;
create table sys_job (
  job_id              bigint(20)    not null auto_increment    comment 'ジョブID',
  job_name            varchar(64)   default ''                 comment 'ジョブ名',
  job_group           varchar(64)   default 'DEFAULT'          comment 'ジョブグループ',
  invoke_target       varchar(500)  not null                   comment 'コールターゲット',
  cron_expression     varchar(255)  default ''                 comment 'cron表現',
  misfire_policy      varchar(20)   default '3'                comment 'エラー発生の場合（1直ぐに実行 2一度実行 3放棄実行）',
  concurrent          char(1)       default '1'                comment '併発（0許可 1不許可）',
  status              char(1)       default '0'                comment '状態（0正常 1暂停）',
  create_by           varchar(64)   default ''                 comment '作成者',
  create_time         datetime                                 comment '作成時間',
  update_by           varchar(64)   default ''                 comment '更新者',
  update_time         datetime                                 comment '更新時間',
  remark              varchar(500)  default ''                 comment '備考',
  primary key (job_id, job_name, job_group)
) engine=innodb auto_increment=100 comment = '定时任务调度表';

insert into sys_job values(1, 'システム黙認（パラメータなし）', 'DEFAULT', 'ryTask.ryNoParams',        '0/10 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
insert into sys_job values(2, 'システム黙認（パラメータある）', 'DEFAULT', 'ryTask.ryParams(\'ry\')',  '0/15 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
insert into sys_job values(3, 'システム黙認（複数パラメータ）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 17、定时任务调度日志表
-- ----------------------------
drop table if exists sys_job_log;
create table sys_job_log (
  job_log_id          bigint(20)     not null auto_increment    comment 'ジョブログID',
  job_name            varchar(64)    not null                   comment 'ジョブ名',
  job_group           varchar(64)    not null                   comment 'ジョブグループ',
  invoke_target       varchar(500)   not null                   comment 'コールターゲット',
  job_message         varchar(500)                              comment 'ログ',
  status              char(1)        default '0'                comment '実行状態（0成功 1失敗）',
  exception_info      varchar(2000)  default ''                 comment '異常情報',
  create_time         datetime                                  comment '作成時間',
  primary key (job_log_id)
) engine=innodb comment = '定時ジョブコールログ表';


-- ----------------------------
-- 18、通知公告表
-- ----------------------------
drop table if exists sys_notice;
create table sys_notice (
  notice_id         int(4)          not null auto_increment    comment '通知ID',
  notice_title      varchar(50)     not null                   comment '通知タイトル',
  notice_type       char(1)         not null                   comment '通知種類（1通知 2公告）',
  notice_content    varchar(2000)   default null               comment '通知内容',
  status            char(1)         default '0'                comment '通知状態（0正常 1終了）',
  create_by         varchar(64)     default ''                 comment '作成者',
  create_time       datetime                                   comment '作成時間',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新時間',
  remark            varchar(255)    default null               comment '備考',
  primary key (notice_id)
) engine=innodb auto_increment=10 comment = '通知公告表';

-- ----------------------------
-- 初始化-公告信息表数据
-- ----------------------------
insert into sys_notice values('1', 'notice：2018-07-01 システム開発完了しました', '2', 'version1.0.1発表', '0', 'admin', sysdate(), '', null, '管理者');
insert into sys_notice values('2', '更新通知：2018-07-01 ', '1', '更新内容',   '0', 'admin', sysdate(), '', null, '管理者');


-- ----------------------------
-- 19、代码生成业务表
-- ----------------------------
drop table if exists gen_table;
create table gen_table (
  table_id             bigint(20)      not null auto_increment    comment 'テーブル',
  table_name           varchar(200)    default ''                 comment 'テーブル名',
  table_comment        varchar(500)    default ''                 comment 'テーブル描写',
  sub_table_name       varchar(64)     default null               comment '子テーブル名',
  sub_table_fk_name    varchar(64)     default null               comment '子テーブルFK名',
  class_name           varchar(100)    default ''                 comment 'エンティティー名',
  tpl_category         varchar(200)    default 'crud'             comment '使用するテンプレート（crud単一テーブル treeツリーテーブル subプライマリ子テーブル）',
  package_name         varchar(100)                               comment 'パッケージ パス',
  module_name          varchar(30)                                comment 'モジュール名',
  business_name        varchar(30)                                comment 'ビジネス名',
  function_name        varchar(50)                                comment '機能名',
  function_author      varchar(50)                                comment '機能作成者',
  gen_type             char(1)         default '0'                comment 'コード作成方法（0zipアーカイブ 1ブラウザーパス）',
  gen_path             varchar(200)    default '/'                comment '作成パス（不填默认项目路径）',
  options              varchar(1000)                              comment '他の作成選択',
  create_by            varchar(64)     default ''                 comment '作成者',
  create_time 	       datetime                                   comment '作成時間',
  update_by            varchar(64)     default ''                 comment '更新者',
  update_time          datetime                                   comment '更新時間',
  remark               varchar(500)    default null               comment '備考',
  primary key (table_id)
) engine=innodb auto_increment=1 comment = '代码生成业务表';


-- ----------------------------
-- 20、代码生成业务表字段
-- ----------------------------
drop table if exists gen_table_column;
create table gen_table_column (
  column_id         bigint(20)      not null auto_increment    comment 'コラムID',
  table_id          bigint(20)                                 comment 'テーブルID',
  column_name       varchar(200)                               comment 'コラム名',
  column_comment    varchar(500)                               comment 'コラム描写',
  column_type       varchar(100)                               comment 'コラム種類',
  java_type         varchar(500)                               comment 'JAVA種類',
  java_field        varchar(200)                               comment 'JAVAコラム名',
  is_pk             char(1)                                    comment '主キー（1YES）',
  is_increment      char(1)                                    comment 'インクリメント（1YES）',
  is_required       char(1)                                    comment '入力（1YES）',
  is_insert         char(1)                                    comment '挿入（1YES）',
  is_edit           char(1)                                    comment '編集（1YES）',
  is_list           char(1)                                    comment 'リスト（1YES）',
  is_query          char(1)                                    comment '検索（1YES）',
  query_type        varchar(200)    default 'EQ'               comment '検索方法（eq、ne、gt、lt、ge、le）',
  html_type         varchar(200)                               comment '表示種類（テキストボックス、テキストフィールド、ドロップダウンボックス、チェックボックス、ラジオボックス、日付コントロール）',
  dict_type         varchar(200)    default ''                 comment '辞書種類',
  sort              int                                        comment 'ソート',
  create_by         varchar(64)     default ''                 comment '作成者',
  create_time 	    datetime                                   comment '作成時間',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新時間',
  primary key (column_id)
) engine=innodb auto_increment=1 comment = 'コード作成ビジネス';