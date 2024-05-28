part of 'face.dart';

Face _$FaceFromJson(Map<String, dynamic> json) => Face(
      id: json['id'] as int,
      number: json['number'] as int,
      status: json['status'] as String,
      insertedAt: json['inserted_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$FaceToJson(Face instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'status': instance.status,
      'inserted_at': instance.insertedAt,
      'updated_at': instance.updatedAt,
    };

Map<String, dynamic> _$FaceToMap(Map<String, dynamic> map) => <String, dynamic>{
      'id': map['id'],
      'number': map['number'],
      'status': map['status'],
      'inserted_at': map['inserted_at'],
      'updated_at': map['updated_at'],
    };
