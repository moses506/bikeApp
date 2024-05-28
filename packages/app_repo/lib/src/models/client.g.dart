part of 'client.dart';

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as int,
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      registrationNumber: json['registration_number'] as String,
      telephoneNumber: json['telephone_number'] as String,
      town: json['town'] as String,
      email: json['email'] as String,
      country: json['country'] as String,
      businessType: json['business_type'] as String,
      address: json['address'] as String,
      incorporationDate: json['incorporation_date'] as String,
      status: json['status'] as String,
      insertedAt: json['inserted_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'registration_number': instance.registrationNumber,
      'telephone_number': instance.telephoneNumber,
      'town': instance.town,
      'email': instance.email,
      'country': instance.country,
      'business_type': instance.businessType,
      'address': instance.address,
      'incorporation_date': instance.incorporationDate,
      'status': instance.status,
      'inserted_at': instance.insertedAt,
      'updated_at': instance.updatedAt,
    };

Map<String, dynamic> _$ClientToMap(Map<String, dynamic> map) =>
    <String, dynamic>{
      'id': map['id'],
      'name': map['name'],
      'phone_number': map['phone_number'],
      'registration_number': map['registration_number'],
      'telephone_number': map['telephone_number'],
      'town': map['town'],
      'email': map['email'],
      'country': map['country'],
      'business_type': map['business_type'],
      'address': map['address'],
      'incorporation_date': map['incorperation_date'],
      'status': map['status'],
      'inserted_at': map['inserted_at'],
      'updated_at': map['updated_at'],
    };
