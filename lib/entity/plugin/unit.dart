class PluginUnitInfo {
  final String id;
  final String name;
  final String version;
  final String description;
  final PluginUnitType? unitType;
  final List<PluginUnitParam> params;

  PluginUnitInfo({
    required this.id,
    required this.name,
    required this.version,
    required this.description,
    this.unitType,
    required this.params,
  });

  static PluginUnitInfo fromJson(unit) {
    return PluginUnitInfo(
      id: unit['id'],
      name: unit['name'],
      version: unit['version'],
      description: unit['description'],
      // 默认其实为空
      unitType: PluginUnitType.formString(unit["unit_type"]),
      params: unit['params'] != null
          ? (unit['params'] as List)
                .map((symbol) => PluginUnitParam.fromJson(symbol))
                .toList()
          : [],
    );
  }

  @override
  String toString() {
    return name;
  }
}

enum PluginUnitType {
  Operator,
  Abstraction,
  Concreteness;

  static PluginUnitType formString(String name) {
    return values.firstWhere((element) => element.name == name);
  }
}

class PluginUnitParam {
  final String key;
  final String description;
  final PluginUnitParamType type_;
  final bool required;
  final dynamic default_;

  PluginUnitParam({
    required this.key,
    required this.description,
    required this.type_,
    required this.required,
    required this.default_,
  });

  static PluginUnitParam fromJson(param) {
    return PluginUnitParam(
      key: param['key'],
      description: param['description'],
      type_: PluginUnitParamType.formString(param['type_']),
      required: param['required'],
      default_: param['default'],
    );
  }
}

enum PluginUnitParamType {
  Str,
  Int,
  Float,
  Bool,
  Obj,
  Arr;

  static PluginUnitParamType formString(String name) {
    return values.firstWhere((element) => element.name == name);
  }
}
