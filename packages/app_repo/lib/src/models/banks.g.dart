part of 'banks.dart';

Bank _$BioFromJson(Map<String, dynamic> json) => Bank(
      id: int.tryParse(json['id'].toString()) ?? 0,
      bankName: json['bankName'] as String? ?? '',
      processBranch: json['process_branch'] as String? ?? '',
      centerCode: json['center_code'] as String? ?? '',
      bankDescript: json['bank_descrip'] as String? ?? '',
      bankCode: json['bank_code'] as String? ?? '',
      acronym: json['acronym'] as String? ?? '',
    );

Map<String, dynamic> _$BioToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'bankName': instance.bankName,
      'process_branch': instance.processBranch,
      'center_code': instance.centerCode,
      'bank_descrip': instance.bankDescript,
      'bank_code': instance.bankCode,
      'acronym': instance.acronym,
    };

Map<String, dynamic> _$BioToMap(Map<String, dynamic> json) => <String, dynamic>{
      'id': int.tryParse(json['id'].toString()) ?? 0,
      'bankName': json['bankName'],
      'process_branch': json['process_branch'],
      'center_code': json['center_code'],
      'bank_descrip': json['bank_descrip'],
      'acronym': json['acronym'],
    };
