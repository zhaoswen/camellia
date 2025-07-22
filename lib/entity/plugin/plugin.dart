import 'unit.dart';

class Plugin {
  // 全局唯一id（插件路径）
  // 如 mysql（仅官方插件使用）
  // 如 site.zhaosw:mysql（适用于所有用户）
  final String id;

  // 插件名称
  final String name;

  // 插件版本
  final String version;

  // 插件类型
  final List<PluginUnitType> pluginType;

  // 插件描述
  final String? description;

  // 插件作者
  final String? author;

  // 插件状态
  final String? pluginStatus;

  // 插件单元信息
  final List<PluginUnitInfo>? pluginUnit;

  Plugin({
    required this.id,
    required this.name,
    required this.version,
    required this.pluginType,
    this.description,
    this.author,
    this.pluginStatus,
    this.pluginUnit,
  });

  factory Plugin.fromJson(Map<String, dynamic> json) {
    return Plugin(
      id: json['id'],
      name: json['name'],
      version: json['version'],
      pluginType: [],
      description: json['description'],
      author: json['author'],
      pluginStatus: json['plugin_status'],
      pluginUnit: json['plugin_unit'] != null
          ? (json['plugin_unit'] as List)
                .map((symbol) => PluginUnitInfo.fromJson(symbol))
                .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'version': version,
      'plugin_type': pluginType,
      'description': description,
      'author': author,
      'plugin_status': pluginStatus,
      'plugin_unit': pluginUnit,
    };
  }
}
