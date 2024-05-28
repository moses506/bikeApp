part of 'product.dart';

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: int.tryParse(json['id'].toString()) ?? 0,
      arrangementFee: double.tryParse(json['arrangement_fee'].toString())??0.0,
      chargesId: int.tryParse(json['charges_account_id'].toString())??0,
      classificationId: int.tryParse(json['classification_id'].toString())??0,
      clientId:int.tryParse(json['clientId'].toString())??0,
      code: json['code']as String? ??'',
      currencyDecimals:double.tryParse(json['currencyDecimals'].toString())?? 0.0,
      currencyId:int.tryParse(json['currencyId'].toString())??0,
      currencyName:json['currencyName'] as String? ??'',
      defaultPeriod: int.tryParse(json['defaultPeriod'].toString())??0,
      details:json['details'] as String? ??'',
      financeCost: double.tryParse(json['finance_cost'].toString())??0.0,
      interest:double.tryParse(json['interest'].toString())??0.0,
      interestMode:json['interestMode']as String? ??'',
      interestType:int.tryParse(json['interestType'].toString())??0,
      interestId: int.tryParse(json['interest_account_id'].toString())??0,
      maximumPrincipal:double.tryParse(json['maximumPrincipal'].toString())??0.0,
      minimumPrincipal:double.tryParse(json['minimumPrincipal'].toString())??0.0,
      name: json['name']as String? ??'',
      periodType:json['periodType']as String? ??'',
      principleId: int.tryParse(json['principle_account_id'].toString())??0,
      productType:json['productType']as String? ??'',
      reason:  json['reason']as String? ??'',
      referenceId: int.tryParse(json['reference_id'].toString())??0,
      status: json['status']as String? ??'',
      yearLengthInDays:int.tryParse(json['yearLengthInDays'].toString())??0,






    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
     'arrangement_fee':instance.arrangementFee,

      'charges_account_id':instance.chargesId,

      'classification_id':instance.classificationId,
      'clientId':instance.clientId,
      'code':instance.code,
      'currencyDecimals':instance.currencyDecimals,
      'currencyId':instance.currencyId,
      'currencyName':instance.currencyName,
      'defaultPeriod':instance.defaultPeriod,
      'details':instance.details,
    'finance_cost':instance.financeCost,
      'interest':instance.interest,
      'interestMode':instance.interestMode,
      'interestType':instance.interestType,
      'interest_account_id':instance.interestId,
      'maximumPrincipal':instance.maximumPrincipal,
      'minimumPrincipal':instance.minimumPrincipal,

      'name':instance.name,
      'periodType':instance.periodType,
      'principle_account_id':instance.principleId,
     'productType':instance.periodType,

      'reason':instance.reason,
      'reference_id':instance.referenceId,
      'status':instance.status,
      'yearLengthInDays':instance.yearLengthInDays,
      
    };

Map<String, dynamic> _$ProductToMap(Map<String, dynamic> json) => <String, dynamic>{
      'id': int.tryParse(json['id'].toString()) ?? 0,
      'arrangement_fee': double.tryParse(json['arrangement_fee'].toString())??0.0,
      'charges_account_id': int.tryParse(json['charges_account_id'].toString())??0,
      'classification_id': int.tryParse(json['classification_id'].toString())??0,
      'clientId':int.tryParse(json['clientId'].toString())??0,
      'code': json['code']as String? ??'',
      'currencyDecimals':double.tryParse(json['currencyDecimals'].toString())?? 0.0,
      'currencyId':int.tryParse(json['currencyId'].toString())??0,
      'currencyName':json['currencyName'] as String? ??'',
      'defaultPeriod': int.tryParse(json['defaultPeriod'].toString())??0,
      'details':json['details'] as String? ??'',
      'finance_cost': double.tryParse(json['finance_cost'].toString())??0.0,
      'interest':double.tryParse(json['interest'].toString())??0.0,
      'interestMode':json['interestMode']as String? ??'',
      'interestType':int.tryParse(json['interestType'].toString())??0,
      'interest_account_id': int.tryParse(json['interest_account_id'].toString())??0,
      'maximumPrincipal':double.tryParse(json['maximumPrincipal'].toString())??0.0,
      'minimumPrincipal':double.tryParse(json['minimumPrincipal'].toString())??0.0,
      'name': json['name']as String? ??'',
      'periodType':json['periodType']as String? ??'',
      'principle_account_id': int.tryParse(json['principle_account_id'].toString())??0,
      'productType':json['productType']as String? ??'',
      'reason':  json['reason']as String? ??'',
      'reference_id': int.tryParse(json['reference_id'].toString())??0,
      'status': json['status']as String? ??'',
      'yearLengthInDays':int.tryParse(json['yearLengthInDays'].toString())??0,
    };
