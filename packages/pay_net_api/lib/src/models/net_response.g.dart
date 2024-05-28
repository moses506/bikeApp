part of 'net_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetResponse _$NetResponseFromJson(dynamic json) {
  return NetResponse(
    // status: (json as JMap)['status'] as String? ?? 'success',
    status: int.tryParse((json as JMap)['status'].toString())?? 0,
    message: json['message'] as String? ?? json['data'].toString(),
    data: json['data'],
  );
}

NetResponse _$NetResponseFromString(dynamic json) {
  final data = jsonDecode(json.toString());
  return NetResponse(
    // status: (data as JMap)['status'] as String? ?? 'success',
    status: int.tryParse(( data as JMap).toString())?? 0,
    message: data['message'] as String? ?? data['data'].toString(),
    data: data['data'],
  );
}

NetResponse _$NetResponseWithBool(dynamic json) {
  final data = jsonDecode(json.toString());
  return NetResponse(
    // status: (data as JMap)['status'] == true ? 'success' : 'error',
    status:  (data as JMap)['status']== 0 ? 0 :1,
    message: data['message'] as String? ?? data['data'].toString(),
    data: data['data'],
  );
}
