part of 'balance.dart';

Balance _$BalanceFromJson(Map<String, dynamic> json) => Balance(
      id: int.tryParse(json['id'].toString()) ?? 0,
     balance:  double.tryParse(json['balance'].toString())?? 0.0,
     companyId: int.tryParse(json['company_id'].toString())??0,
     customerId: int.tryParse(json['customer_id'].toString())?? 0,
     firstName: json['firstName'] as String? ??'',
     lastName:  json['lastName'] as String? ??'',
    );

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'id': instance.id,
     'balance':instance.balance,
     'company_id':instance.companyId,
     'customer_id':instance.companyId,
     'firstName':instance.firstName,
     'lastName':instance.lastName,




    };

Map<String, dynamic> _$BalanceToMap(Map<String, dynamic> json) => <String, dynamic>{
      'id': int.tryParse(json['id'].toString()) ?? 0,
      'balance':  double.tryParse(json['balance'].toString())?? 0.0,
     'company_id': int.tryParse(json['company_id'].toString())??0,
     'customer_id': int.tryParse(json['customer_id'].toString())?? 0,
     'firstName': json['firstName'] as String? ??'',
     'lastName':  json['lastName'] as String? ??'',
    };
