part of 'net_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetResponse _$NetResponseFromJson(dynamic json) {
  return NetResponse(
    status: (json as JsonMap)['status'] as String? ?? 'success',
    message: json['message'] as String? ?? json['data'].toString(),
    data: json['data'],
  );
}

NetResponse _$NetResponseFromString(dynamic json) {
  final data = jsonDecode(json.toString());
  return NetResponse(
    status: (data as JsonMap)['status'] as String? ?? 'success',
    message: data['message'] as String? ?? data['data'].toString(),
    data: data['data'],
  );
}

NetResponse _$NetResponseWithBool(dynamic json) {
  final data = jsonDecode(json.toString());
  return NetResponse(
    status: (data as JsonMap)['status'] == true ? 'success' : 'error',
    message: data['message'] as String? ?? data['data'].toString(),
    data: data['data'],
  );
}
