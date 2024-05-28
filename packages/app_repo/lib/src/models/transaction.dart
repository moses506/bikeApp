import 'package:equatable/equatable.dart';

part 'transaction.g.dart';

/// {@template area}
/// Area description
/// {@endtemplate}
class Transaction extends Equatable {
  /// {@macro area}
  const Transaction({
    required this.id,
   required this.emailAddress,
   required this.employeeId,
   required this.employeeNum,
   required this.firstName,
   required this.insertedAt,
   required this.lastName,
   required this.loanId,
   required this.merchantId,
   required this.mobileNum,
   required this.nrcNumber,
   required this.paymentAmount,
   required this.referencNo,
   required this.merchantName,
    
  });

  /// Creates a Area from Json map
  factory Transaction.fromJson(Map<String, dynamic> data) =>
      _$TransactionFromJson(data);

  

  /// A description for id
  final int id;

  /// A description for emailaddress
  final String emailAddress;
  /// A description for employee_id
  final int employeeId;
  /// A decription for employee_number
  final String employeeNum;
  /// A description for firstname
  final String firstName;
/// A desciption for inserted_at
final String insertedAt;
/// A description for lastname
final String lastName;
/// A description for loan_id
final int loanId;
/// A description for merchantid
final int merchantId;
/// A desciption for mobile_number
final String mobileNum;
/// A description for nrc_number
final String nrcNumber;
/// A description for payment_amount
final double paymentAmount;
/// a description for reference_no
final String referencNo;
/// A description for merchant name 
final String merchantName;


  /// Creates a copy of the current Area with property changes
  Transaction copyWith({
    int ?id,

   String? emailAddress,
   int? employeeId,
   String? employeeNum,
   String? firstName,
 String ?insertedAt,
 String? lastName,
 int ?loanId,
 int? merchantId,
 String ?mobileNum,
 String? nrcNumber,
 double? paymentAmount,
 String? referencNo,
 String? merchantName,
  }) {
    return Transaction(
      id: id ?? this.id,
    emailAddress: emailAddress?? this.emailAddress,
    employeeId: employeeId?? this.employeeId,
    employeeNum: employeeNum?? this.employeeNum,
    firstName:  firstName?? this.firstName,
    insertedAt: insertedAt?? this.insertedAt,
    lastName:  lastName?? this.lastName,
    loanId: loanId?? this.loanId,
    merchantId: merchantId?? this.merchantId,
    mobileNum: mobileNum ?? this.mobileNum,
    nrcNumber: nrcNumber?? this.nrcNumber,
    paymentAmount:  paymentAmount?? this.paymentAmount,
    referencNo: referencNo?? this.referencNo,
    merchantName: merchantName?? this.merchantName,
    );
  }

  @override
  List<Object?> get props => [
        id,
      emailAddress,
      employeeId,
      employeeNum,
      firstName,
      lastName,
      loanId,
      merchantId,
      mobileNum,nrcNumber,
      paymentAmount,
      referencNo,
       
        insertedAt,
        merchantName,
       
      ];

  /// Creates a Json map from a Area
  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  /// Creates a Json map from a Area
  static Map<String, dynamic> toMap(Map<String, dynamic> map) =>
      _$TransactionToMap(map);
}
