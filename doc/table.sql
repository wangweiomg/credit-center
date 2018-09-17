-- CREATE database credit DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE t_card (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id' ,
  name VARCHAR(32) NOT NULL COMMENT '名称',
  card_no VARCHAR(32) COMMENT '卡号',
  bank_id tinyint(2) COMMENT '银行ID',
  card_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '1信用卡 2.储蓄卡',
  card_limit DECIMAL(10, 2) NOT NULL COMMENT '卡片额度',
  bill_day tinyint(2) NOT NULL COMMENT '账单日',
  repay_day_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '还款日类型1.固定还款日 2.账单日后多少天',
  repay_day_num tinyint(2) NOT NULL COMMENT '还款日记数',
  status tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1.启用中 2.已停用',
  create_by int(11) COMMENT '创建人ID',
  create_at datetime COMMENT '创建时间',
  update_by int(11) COMMENT '更新人ID',
  update_at datetime COMMENT '更新时间',
  delete_flag tinyint(1) DEFAULT 0 COMMENT '删除标志1.是 0否',
  UNIQUE (id),
  PRIMARY KEY (id)
) COMMENT '卡片表';