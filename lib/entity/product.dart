class Product {
  String id;
  String name;
  String description;
  String author;
  String updateUrl;
  String createTime;
  String updateTime;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.author,
    required this.updateUrl,
    required this.createTime,
    required this.updateTime,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      author: json['author'],
      updateUrl: json['update_url'],
      createTime: json['create_time'],
      updateTime: json['update_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'author': author,
      'update_url': updateUrl,
      'create_time': createTime,
      'update_time': updateTime,
    };
  }
}
