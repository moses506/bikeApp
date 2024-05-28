part of 'size.dart';

AdSize _$SizeFromJson(Map<String, dynamic> json) => AdSize(
      id: json['id'] as int,
      height: json['height'] as String,
      width: json['width'] as String,
      status: json['status'] as String,
      insertedAt: json['inserted_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$SizeToJson(AdSize instance) => <String, dynamic>{
      'id': instance.id,
      'height': instance.height,
      'width': instance.width,
      'status': instance.status,
      'inserted_at': instance.insertedAt,
      'updated_at': instance.updatedAt,
    };

Map<String, dynamic> _$SizeToMap(Map<String, dynamic> map) => <String, dynamic>{
      'id': map['id'],
      'height': map['height'],
      'width': map['width'],
      'status': map['status'],
      'inserted_at': map['inserted_at'],
      'updated_at': map['updated_at'],
    };
