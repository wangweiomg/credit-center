-- CREATE database credit DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


DROP TABLE IF EXISTS t_card;
CREATE TABLE t_card (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
  user_id INT NOT NULL COMMENT '所属人id',
  name VARCHAR(32) NOT NULL COMMENT '名称',
  card_no VARCHAR(32) COMMENT '卡号',
  password VARCHAR(10) COMMENT '密码',
  bank_id tinyint(2) NOT NULL COMMENT '银行ID',
  card_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '1信用卡 2.储蓄卡',
  card_limit DECIMAL(10, 2) NOT NULL COMMENT '卡片额度',
  bill_day tinyint(2) NOT NULL COMMENT '账单日',
  repay_day_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '还款日类型1.固定还款日 2.账单日后多少天',
  repay_day_num tinyint(2) NOT NULL COMMENT '还款日记数',
  status tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1.启用中 2.已停用',
  remark VARCHAR(100) COMMENT '备注',
  create_by int(11) COMMENT '创建人ID',
  create_at datetime COMMENT '创建时间',
  update_by int(11) COMMENT '更新人ID',
  update_at datetime COMMENT '更新时间',
  delete_flag tinyint(1) DEFAULT 0 COMMENT '删除标志1.是 0否',
  UNIQUE (id),
  PRIMARY KEY (id)
) COMMENT '卡片表';


DROP TABLE IF EXISTS t_bill;
CREATE TABLE t_bill (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  user_id INT NOT NULL COMMENT '所属人id',
  card_id INT NOT NULL COMMENT '卡片id',
  amount DECIMAL(10, 2) COMMENT '消费金额',
  merchant_type VARCHAR(20) COMMENT '商户类型',
  remark VARCHAR(100) COMMENT '备注',
  create_by int(11) COMMENT '创建人ID',
  create_at datetime COMMENT '创建时间',
  update_by int(11) COMMENT '更新人ID',
  update_at datetime COMMENT '更新时间',
  delete_flag tinyint(1) DEFAULT 0 COMMENT '删除标志1.是 0否',
  UNIQUE (id),
  PRIMARY KEY (id)

) COMMENT '消费账单表';

DROP TABLE IF EXISTS t_repayment;
CREATE TABLE t_repayment (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  card_id INT NOT NULL COMMENT '卡片id',
  amount DECIMAL(10, 2) COMMENT '还款金额',
  remark VARCHAR(100) COMMENT '备注',
  create_by int(11) COMMENT '创建人ID',
  create_at datetime COMMENT '创建时间',
  update_by int(11) COMMENT '更新人ID',
  update_at datetime COMMENT '更新时间',
  delete_flag tinyint(1) DEFAULT 0 COMMENT '删除标志1.是 0否',
  PRIMARY KEY (id)

) COMMENT '还款记录表';


-- 用户表
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  login_name VARCHAR(30) NOT NULL COMMENT '登陆名',
  password VARCHAR(100) NOT NULL COMMENT '密码',
  name VARCHAR(30) NOT NULL COMMENT '用户名',
  email VARCHAR(60) COMMENT '邮箱',
  mobile VARCHAR(30) COMMENT '手机号',
  status tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1.启用中 2.已停用',
  wx_open_id VARCHAR(60) COMMENT '微信open id',
  wx_union_id VARCHAR(60) COMMENT '微信union id',
  nick_name VARCHAR(30) COMMENT '用户昵称',
  avatar_url VARCHAR(300) COMMENT '用户头像URL',
  gender TINYINT(1) COMMENT '性别1.男 2女 0未知',
  country VARCHAR(30) COMMENT '用户所在国家',
  province VARCHAR(30) COMMENT '用户所在省份',
  city VARCHAR(30) COMMENT '用户所在城市',
  language VARCHAR(30) COMMENT '所用的语言',

  remark VARCHAR(100) COMMENT '备注',
  create_by int(11) COMMENT '创建人ID',
  create_at datetime COMMENT '创建时间',
  update_by int(11) COMMENT '更新人ID',
  update_at datetime COMMENT '更新时间',
  delete_flag tinyint(1) DEFAULT 0 COMMENT '删除标志1.是 0否'

)COMMENT '用户';
CREATE INDEX idx_sys_user_login_name ON sys_user(login_name) ;
CREATE INDEX idx_sys_user_email ON sys_user(email);
CREATE INDEX idx_sys_user_mobile ON sys_user(mobile);
CREATE INDEX idx_sys_user_wx_union_id ON sys_user(wx_union_id);

-- init user
INSERT INTO sys_user (id, login_name, password, name, email, mobile, status, wx_open_id, wx_union_id, nick_name, avatar_url, gender, country, province, city, language, remark, create_by, create_at, update_by, update_at, delete_flag) VALUES (1, 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', 'admin', 'wangwei_omg@163.com', '18911580722', 1, null, null, '取个好名字', null, 1, null, null, null, null, null, 1, now(), 1, now(), 0);



DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role(
  id INT(11) AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
  name VARCHAR(30) COMMENT '角色名',
  type TINYINT(1) COMMENT '角色类型 1.管理员 2.系统管理员 3.客户',
  remark VARCHAR(100) COMMENT '备注',
  create_by INT(11) COMMENT '创建人',
  create_at DATETIME COMMENT '创建时间',
  update_by INT(11) COMMENT '更新人',
  update_at DATETIME COMMENT '更新时间',
  delete_flag TINYINT(1) COMMENT '1 删除 0正常'
) COMMENT '角色表';

DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role (
  user_id INT(11),
  role_id INT(11),
  PRIMARY KEY (user_id, role_id)
);

DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu (
  id INT(11) PRIMARY KEY AUTO_INCREMENT COMMENT 'id',
  parent_id INT(11) COMMENT 'parent id',
  parent_ids VARCHAR(100) COMMENT 'parentIds',
  name VARCHAR(50) COMMENT '名字',
  type TINYINT(1) COMMENT '1.菜单 2.权限操作',
  permission VARCHAR(100) COMMENT '权限码',
  sort INT(11) COMMENT '排序',
  url VARCHAR(100) COMMENT '链接',
  icon VARCHAR(100) COMMENT '图标',
  status TINYINT(1) COMMENT '1在用 2停用',
  remark VARCHAR(100) COMMENT '备注',
  create_by INT(11) COMMENT '创建人',
  create_at DATETIME COMMENT '创建时间',
  update_by INT(11) COMMENT '更新人',
  update_at DATETIME COMMENT '更新时间',
  delete_flag TINYINT(1) COMMENT '1 删除 0正常'

) COMMENT '资源表';


DROP TABLE IF EXISTS sys_role_menu;
CREATE TABLE sys_auth (
  role_id INT(11) COMMENT '角色ID',
  menu_id INT(11) COMMENT '资源ID',
  PRIMARY KEY (role_id, menu_id)
) COMMENT '授权表';


DROP TABLE IF EXISTS sys_dict;
CREATE TABLE sys_dict (
  id INT(11) AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
  type VARCHAR(100) COMMENT '类型',
  label VARCHAR(100) COMMENT '标签',
  value VARCHAR(100) COMMENT '值',
  description VARCHAR(100) COMMENT '描述',
  sort INT(11) COMMENT '排序',
  remark VARCHAR(100) COMMENT '备注',
  create_by INT(11) COMMENT '创建人',
  create_at DATETIME COMMENT '创建时间',
  update_by INT(11) COMMENT '更新人',
  update_at DATETIME COMMENT '更新时间',
  delete_flag TINYINT(1) COMMENT '1 删除 0正常'

) COMMENT '字典';
