class DesignLogger {
  // 操作id
  String id;

  // 描述符 id
  String? symbolId;

  // 描述文件 id
  String? profileId;

  // 版本id
  String? versionId;

  // 产品id
  String productId;

  // 类型
  DesignOperatorType operationType;

  // 操作目标
  DesignOperationTarget operationTarget;

  // 数据
  dynamic data;

  // 时间
  String datetime;

  DesignLogger({
    required this.id,
    this.symbolId,
    this.profileId,
    this.versionId,
    required this.productId,
    required this.operationType,
    required this.operationTarget,
    this.data,
    required this.datetime,
  });
}

enum DesignOperatorType {
  // 创建
  create,
  // 修改
  update,
  // 删除状态
  delete,
}

enum DesignOperationTarget {
  // 描述文件
  profile,
  // 描述符
  symbol,
  // 版本
  version,
  // 产品
  product,
  // 状态
  status,
  // 插件
  plugin,
  // 抽象器
  abstraction,
  // 具象器
  concrete,
  // 状态栈
  statusStack,
  // 设计日志
  designLog,
  // 状态日志
  statusLog,
  // 插件日志
  pluginLog,
  // 插件日志
}
