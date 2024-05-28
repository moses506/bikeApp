part of 'bio.dart';

Bio _$BioFromJson(Map<String, dynamic> json) => Bio(
      id: int.tryParse(json['id'].toString()) ?? 0,
      status: json['status']as String? ?? '',
      clientId: int.tryParse(json['client_id'].toString())?? 0,
      commecialUtilityID:json['commecialUtilityID']as String? ??'',
      userName:json['username'] as String? ??'',
    );

Map<String, dynamic> _$BioToJson(Bio instance) => <String, dynamic>{
      'id': instance.id,
      'status':instance.status,
      'client_id':instance.clientId,
      'commecialUtilityID':instance.commecialUtilityID,
      'username':instance.userName,
    };

Map<String, dynamic> _$BioToMap(Map<String, dynamic> json) =>
    <String, dynamic>{
      'id': int.tryParse(json['id'].toString()) ?? 0,
     'status':json['status'],
     'client_id':json['client_id'],
     'commecialUtilityID':json['commecialUtilityID'],
     'username':json['username'],
     

    };
