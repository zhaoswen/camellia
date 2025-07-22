import 'datasource.dart';

class Version {
  String id;
  String productId;
  String? description;
  String? state;
  List<dynamic>? dependencies;
  List<Datasource>? datasource;
  String createTime;
  String updateTime;

  Version({
    required this.id,
    required this.productId,
    required this.description,
    required this.dependencies,
    required this.datasource,
    required this.state,
    required this.createTime,
    required this.updateTime,
  });

  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(
      id: json['id'],
      productId: json['product_id'],
      description: json['description'],
      dependencies: json['dependencies'],
      datasource: json['datasource'] != null
          ? (json['datasource'] as List)
                .map((e) => Datasource.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
      state: json['state'],
      createTime: json['create_time'],
      updateTime: json['update_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'description': description,
      'dependencies': dependencies,
      'state': state,
      'create_time': createTime,
      'update_time': updateTime,
      'datasource': datasource,
    };
  }

  @override
  String toString() {
    return id;
  }

  static Version getDefault() {
    return Version(
      id: '',
      productId: '',
      description: '',
      dependencies: [],
      datasource: [],
      state: '',
      createTime: '',
      updateTime: '',
    );
  }
}
