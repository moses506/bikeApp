part of 'role.dart';

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: int.tryParse(json['id'].toString()) ?? 0,
      otp: json['otp'] as String? ?? '',
      roleType:json['roleType'] as String? ?? '',
      status: json['status']as String? ?? '',
      userId:json['userId']as String? ??'',
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'otp':instance.otp,
      'roleType':instance.roleType,
      'status':instance.status,
      'userId':instance.userId,
    };

Map<String, dynamic> _$RoleToMap(Map<String, dynamic> json) =>
    <String, dynamic>{
      'id': int.tryParse(json['id'].toString()) ?? 0,
     'otp':json['otp'],
     'roleType':json['roleType'],
     'status':json['stats'],
     'userId':json['userId'],
     

    };
