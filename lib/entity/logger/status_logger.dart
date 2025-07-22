class StatusLog {
  // 操作id
  String id;

  // 状态id
  String statusId;

  // 状态类型
  StatusOperatorType operationType;

  // 状态数据
  dynamic data;

  // 状态时间
  String datetime;

  StatusLog({
    required this.id,
    required this.statusId,
    required this.operationType,
    this.data,
    required this.datetime,
  });
}

enum StatusOperatorType {
  // 读取状态
  select,
  // 写入状态（原本没有）
  insert,
  // 删除状态
  delete,
  // 更新状态
  update,
}
