part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: int.tryParse(json['id'].toString()) ?? 0,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      userId: int.tryParse(json['userId'].toString()) ?? 0,
      otherName: json['otherName'] as String? ?? '',
      meansOfIdentificationType:
          json['meansOfIdentificationType'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      mobileNumber: json['mobileNumber'] as String? ?? '',
      emailAddress: json['emailAddress'] as String? ?? '',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userId': instance.userId,
      'otherName': instance.otherName,
      'meansOfIdentificationType': instance.meansOfIdentificationType,
      'gender': instance.gender,
      'mobileNumber': instance.mobileNumber,
      'emailAddress': instance.emailAddress,
    };

Map<String, dynamic> _$UserToMap(Map<String, dynamic> json) =>
    <String, dynamic>{
      'id': int.tryParse(json['id'].toString()) ?? 0,
      'firstName': json['firstName'] as String? ?? '',
      'lastName': json['lastName'] as String? ?? '',
      'userId': int.tryParse(json['userId'].toString()) ?? 0,
      'otherName': json['otherName'] as String? ?? '',
      'meansOfIdentificationType':
          json['meansOfIdentificationType'] as String? ?? '',
      'gender': json['gender'] as String? ?? '',
      'mobileNumber': json['mobileNumber'] as String? ?? '',
      'emailAddress': json['emailAddress'] as String? ?? '',
    };
