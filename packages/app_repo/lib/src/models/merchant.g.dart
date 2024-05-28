part of 'merchant.dart';

Merchant _$MerchantFromJson(Map<String, dynamic> json) => Merchant(
      id: json['id'] as int? ??0,
      status: json['status'] as String? ??'',
      approvalTrail: json['approval_trail']as String? ??'',
      authLevel: json['authLevel'] as String? ??'',
      bankId: json['bankId'] as int,
      businessName:json['businessName']as String? ??'',
      businessNature:json['businessNature']as String? ??'',
      companyAccountNumber:json['companyAccountNumber']as String? ??'',
      companyName:json['companyName']as String? ??'',
      companyPhone:json['companyPhone']as String? ??'',
      companyRegistrationDate:json['companyRegistrationDate']as String? ??'',
      contactEmail:json['contactEmail']as String? ??'',
      createdByUserId:json['createdByUserId']as String? ??'',
      createdByUserRoleId:json['createdByUserRoleId']as String? ??'',
      merchantType:json['merchantType']as String? ??'',
      merchantNo: json['merchant_number']as String? ??'',
      qrCodeName: json['qr_code_name']as String? ??'',
      qrCodePath: json['qr_code_path'] as String? ??'',
registrationNumber:json['registrationNumber']as String? ??'',
taxNo:json['taxno']as String? ??'',
userId: json['user_id'] as int? ??0
      
    );

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'approval_trail': instance.approvalTrail,
      'authLevel': instance.authLevel,
      'bankId': instance.bankId,
      'businessName':instance.businessName,
      'businessNature':instance.businessNature,
      'companyAccountNumber':instance.companyAccountNumber,
      'companyName':instance.companyName,
      'companyPhone':instance.companyPhone,
      'companyRegistrationDate':instance.companyRegistrationDate,
      'contactEmail':instance.contactEmail,
      'createdByUserId':instance.createdByUserId,
      'createdByUserRoleId':instance.createdByUserRoleId,
      'merchantType':instance.merchantType,
      'merchant_number': instance.merchantNo,
      'qr_code_name': instance.qrCodeName,
      'qr_code_path': instance.qrCodePath,
'registrationNumber':instance.registrationNumber,
'taxno':instance.taxNo,
'user_id':instance.userId,
    };

Map<String, dynamic> _$MerchantToMap(Map<String, dynamic> map) => <String, dynamic>{
      'id': map['id'],
      'status': map['status'],
      'approval_trail':map['approval_trail'],
      'authLevel': map['authLevel'],
      'bankId': map['bankId'],
      'businessName':map['businessName'],
      'businessNature':map['businessNature'],
      'companyAccountNumber':map['companyAccountNumber'],
      'companyName':map['companyName'],
      'companyPhone':map['companyPhone'],
      'companyRegistrationDate':map['companyRegistrationDate'],
      'contactEmail':map['contactEmail'],
      'createdByUserId':map['createdByUserId'],
      'createdByUserRoleId':map['createdByUserRoleId'],
      'merchantType':map['createdByUserRoleId'],
      'merchant_number': map['merchant_number'],
      'qr_code_name': map['qr_code_name'],
      'qr_code_path': map['qr_code_path'],
'registrationNumber':map['registrationNumber'],
'taxno':map['taxno'],
'user_id':map['user_id']
      
    };
