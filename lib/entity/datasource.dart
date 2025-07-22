import 'package:uuid/v4.dart';

class Datasource {
  String id;
  String name;
  String? operator;
  Map<String, dynamic>? operatorParams;
  String? concreteness;
  Map<String, dynamic>? concretenessParams;
  String? abstraction;
  Map<String, dynamic>? abstractionParams;
  bool? disabled;
  bool? readonly;
  String? syncPolicy;

  Datasource({
    required this.id,
    required this.name,
    this.operator = "",
    this.operatorParams = const {},
    this.concreteness = "",
    this.concretenessParams = const {},
    this.abstraction = "",
    this.abstractionParams = const {},
    this.disabled = false,
    this.readonly = false,
    this.syncPolicy = "",
  });

  factory Datasource.fromJson(Map<String, dynamic> json) {
    return Datasource(
      id: json['id'],
      name: json['name'],
      operator: json['operator'],
      operatorParams: json['operator_params'],
      concreteness: json['concreteness'],
      concretenessParams: json['concreteness_params'],
      abstraction: json['abstraction'],
      abstractionParams: json['abstraction_params'],
      disabled: json['disabled'],
      readonly: json['readonly'],
      syncPolicy: json['syncPolicy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'operator': operator,
      'operator_params': operatorParams,
      'concreteness': concreteness,
      'concreteness_params': concretenessParams,
      'abstraction': abstraction,
      'abstraction_params': abstractionParams,
      'disabled': disabled,
      'readonly': readonly,
      'syncPolicy': syncPolicy,
    };
  }

  static getDefault() {
    return Datasource(
      id: UuidV4().generate().toString(),
      name: "",
      operator: null,
      operatorParams: {},
      concreteness: null,
      concretenessParams: {},
      abstraction: null,
      abstractionParams: {},
      disabled: false,
      readonly: false,
      syncPolicy: "",
    );
  }

  @override
  String toString() {
    return name;
  }
}
