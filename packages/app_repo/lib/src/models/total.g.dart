part of 'total.dart';

Total _$TotalFromJson(Map<String, dynamic> json) => Total(
      id: json['id'] as int,
      totalCount: int.tryParse(json['total_count'].toString()) ?? 0,
      totalValue: double.tryParse(json['total_value'].toString()) ?? 0.0,
    );

Map<String, dynamic> _$TotalToJson(Total instance) => <String, dynamic>{
      'id': instance.id,
      'total_count': instance.totalCount,
      'total_value': instance.totalValue,
    };

Map<String, dynamic> _$TotalToMap(Map<String, dynamic> map) =>
    <String, dynamic>{
      'id': map['id'],
      'total_count': map['total_count'],
      'total_value': map['total_value'],
    };
