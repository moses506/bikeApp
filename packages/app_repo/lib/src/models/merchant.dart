
import 'package:equatable/equatable.dart';

part 'merchant.g.dart';

/// {@template face}
/// Face description
/// {@endtemplate}
class Merchant extends Equatable {
  /// {@macro face}
  const Merchant({
    required this.id,
    required this.approvalTrail,
    required this.authLevel,
    required this.bankId,
    required this.businessName,
    required this.businessNature,
    required this.companyAccountNumber,
    required this.companyName,
    required this.companyPhone,
    required this.companyRegistrationDate,
    required this.contactEmail,
    required this.createdByUserId,
    required this.createdByUserRoleId,
    required this.merchantNo,
    required this.merchantType,
    required this.qrCodeName,
    required this.qrCodePath,
    required this .registrationNumber,
  required this.status,
  required this.taxNo,
  required this.userId,
  });

  /// Creates a Face from Json map
  factory Merchant.fromJson(Map<String, dynamic> data) => _$MerchantFromJson(data);

  /// A description for id
  final int id;

 /// A description for approval_trail
 final String approvalTrail;
 /// A description for authLevel
 final String authLevel;
 /// A dscription for authLevel
 final int bankId;
 /// A description for businessName
 final String businessName;
 /// A description for businessNature
 final String businessNature;
 ///  A description for companyAccountNumber
 final String companyAccountNumber;
 /// A desciption for companyName
 final String companyName;
 /// A descriptiuon for companyPhone
 final String companyPhone;
 /// a dscription for companyPhone
 final String companyRegistrationDate;
 /// A description for contactEmail 
 final String contactEmail;
 /// A dsecription for createdByUserId
 final String createdByUserId;
 /// A dsecription for createdByUserRoleId
 final String createdByUserRoleId;
 /// A descioption for merchantType
 final String merchantType;
 /// A description for merchant_number
 final String merchantNo;
 /// A dscription for qr_code_name
 final String qrCodeName;
 /// A description qr_code_path
 final String qrCodePath;
 /// A description for registrationNumber
 final String registrationNumber;
 /// A description forstatus
 final String status;
 /// A description for taxno
 final String taxNo ;
 /// A description for user_id
 final int userId;



  /// Creates a copy of the current Merchant with property changes
  Merchant copyWith({
    int? id,
 String? approvalTrail,
 String? authLevel,
  int? bankId,
  String? businessName,
  String? businessNature,
  String ?companyAccountNumber,
  String? companyName,
  String? companyPhone,
  String? companyRegistrationDate,
  String ?contactEmail,
  String ?createdByUserId,
  String? createdByUserRoleId,
  String? merchantType,
  String? merchantNo,
  String? qrCodeName,
  String? qrCodePath,
  String? registrationNumber,
  String? status,
  String? taxNo,
  int? userId,
  }) {
    return Merchant(
      id: id ?? this.id,
      approvalTrail: approvalTrail?? this.approvalTrail,
      authLevel: authLevel?? this.authLevel,
      bankId: bankId?? this.bankId,
      businessName: businessName?? this.businessName,
      businessNature: businessNature?? this.businessNature,
      companyAccountNumber: companyAccountNumber?? this.companyAccountNumber,
      companyName:  companyName?? this.companyName,
      companyPhone: companyPhone?? this.companyPhone,
      companyRegistrationDate: companyRegistrationDate?? this.companyRegistrationDate,
      contactEmail:  contactEmail?? this.contactEmail,
      createdByUserId: createdByUserId?? this.createdByUserId,
      createdByUserRoleId: createdByUserRoleId?? this.createdByUserRoleId,
      merchantType: merchantType?? this.merchantType,
      merchantNo: merchantNo?? this.merchantNo,
      qrCodePath:  qrCodePath?? this.qrCodePath,
      registrationNumber: registrationNumber?? this.registrationNumber,
      status:  status?? this.status,
      taxNo: taxNo?? this.taxNo,
      userId: userId?? this.userId,
      qrCodeName: qrCodeName ?? this.qrCodeName,
    );
  }

  @override
  List<Object?> get props => [
        id,
        status,
        approvalTrail,
        authLevel,
        bankId,
        businessName,
        businessNature,
        companyAccountNumber,
        companyName,
        companyPhone,
        companyRegistrationDate,
        contactEmail,
        createdByUserId,
        createdByUserRoleId,
        merchantType,
        merchantNo,
        qrCodePath,
        registrationNumber,
        status,
        taxNo,
        userId,
        qrCodeName,
      
      ];

  /// Creates a Json map from a Face
  Map<String, dynamic> toJson() => _$MerchantToJson(this);

  /// Creates a Json map from a Face
  static Map<String, dynamic> toMap(Map<String, dynamic> map) =>
      _$MerchantToMap(map);
}
