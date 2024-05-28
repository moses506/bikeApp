part of 'transaction.dart';

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
     emailAddress: json['emailaddress']as String? ??'',
     employeeId: json['employee_id'] as int,
     employeeNum: json['employee_number']as String? ??'',
     firstName: json['firstname']as String? ??'',
     lastName: json['lastname']as String? ??'',
     loanId:int.tryParse(json['loan_id'].toString())??0,
     merchantId: int.tryParse(json['merchant_id'].toString())?? 0,
     nrcNumber: json['nrc_number']as String? ??'',
     paymentAmount: double.tryParse(json['payment_amount'].toString())??0.0,
     referencNo: json['reference_no']as String? ??'',
     mobileNum: json['mobile_number']as String? ??'',
      id: json['id'] as int,
      insertedAt: json['inserted_at'] as String? ?? '',
      merchantName: json['merchant_name'] as String? ??'',
      
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,

     'emailaddress':instance.emailAddress,
     'employee_id':instance.employeeId,
     'employee_number':instance.employeeNum,
     'firstname':instance.firstName,
     'lastname':instance.lastName,
     'merchant_id':instance.merchantId,
     'mobile_number':instance.mobileNum,
     'nrc_number':instance.nrcNumber,
     'payment_amount':instance.paymentAmount,
     'reference_no':instance.referencNo,
     'inserted_at':instance.insertedAt,
     'merchant_name':instance.merchantName,




     
     };

Map<String, dynamic> _$TransactionToMap(Map<String, dynamic> map) =>
    <String, dynamic>{
      'id': map['id'],
   'emailaddress':map['emailaddress'],
   'employee_id':map['employee_id'],
   'employee_number':map['employee_number'],
   'firstname':map['firstname'],
   'lastname':map['lastname'],
   'merchant_id':map['merchant_id'],
   'mobile_number':map['mobile_number'],
   'nrc_number':map['nrc_number'],
   'payment_amount':map['payment_amount'],
   'reference_no':map['reference_no'],
   'inserted_at':map['inserted_at'],
   'merchant_name':map['merchant_name'],

    
    };
