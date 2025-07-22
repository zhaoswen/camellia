class SysResponse {
  final String code;
  final String? message;
  final bool succeed;
  final dynamic data;
  final String? error;

  SysResponse({
    required this.code,
    this.message,
    required this.succeed,
    required this.data,
    this.error,
  });

  factory SysResponse.fromJson(Map<String, dynamic> json) {
    return SysResponse(
      code: json['code']?.toString() ?? '',
      // 确保类型转换
      message: json['message']?.toString() ?? '',
      succeed: json['succeed'] == true,
      data: json['data'],
      error: json['error']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'succeed': succeed,
      'data': data,
      'error': error,
    };
  }

  @override
  String toString() {
    return 'SysResponse(code: $code, message: $message, succeed: $succeed, data: $data, error: $error)';
  }
}
