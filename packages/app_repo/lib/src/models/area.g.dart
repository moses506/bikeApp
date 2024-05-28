part of 'area.dart';

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      status: json['status'] as String,
      insertedAt: json['inserted_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'status': instance.status,
      'inserted_at': instance.insertedAt,
      'updated_at': instance.updatedAt,
    };

Map<String, dynamic> _$AreaToMap(Map<String, dynamic> map) => <String, dynamic>{
      'id': map['id'],
      'name': map['name'],
      'code': map['code'],
      'status': map['status'],
      'inserted_at': map['inserted_at'],
      'updated_at': map['updated_at'],
    };
