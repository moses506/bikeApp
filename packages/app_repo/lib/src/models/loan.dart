import 'dart:convert';

import 'package:equatable/equatable.dart';

part 'loan.g.dart';

/// {@template user}
/// User description
/// {@endtemplate}
class Loan extends Equatable {
  /// {@macro user}
  const Loan({
    required this.id,
    required this.appUserId,
    required this.approvedonDate,
    required this.chargesWrittenoff,
    required this.companyRegistrationDate,
    required this.currencyDecimals,
    required this.disbursedonDate,
    required this.feeChargesRepaid,
    required this.financeCost,
    required this.firstName,
    required this.gender,
    required this.interestCharged,
    required this.interestMethod,
    required this.lastName,
    required this.loanStatus,
    required this.mobileNumber,
    required this.momoProvider,
    required this.name,
    required this.penaltyCharges,
    required this.penaltyChargesoutstanding,
    required this.principalAmountProposed,
    required this.repayEvery,
    required this.repaymentAmount,
    required this.status,
    required this.title,
    required this.totalCostofloan,
    required this.totalInterest,
    required this.totalOustanding,
    required this.writtenoffonDate,
    required this.yearLength,
    required this.loanType,
    required this.interest,
  });

  /// Creates a User from Json map
  factory Loan.fromJson(Map<String, dynamic> data) => _$LoanFromJson(data);

  /// A desscription for id
  final int id;

  /// A description for total_outstanding_derived
  final String totalOustanding;

  /// A description for yearLengthInDays
  final String yearLength;
  //// A description for total_interest_repaid
  final String totalInterest;

  /// A description for title
  final String title;

  /// A description for currencyDecimals
  final double currencyDecimals;

  /// A description for mobileNumber
  final String mobileNumber;

  /// A description for principal_amount_proposed
  final double principalAmountProposed;

  /// A desccription for fee_charges_repaid_derived
  final String feeChargesRepaid;

  /// A description for repayment_amount
  final String repaymentAmount;

  /// A description for gender
  final String gender;

  /// A description status
  final String status;

  /// A description for writtenoffon_date
  final String writtenoffonDate;

  /// A description for fee_charges_writtenoff_derived
  final String chargesWrittenoff;

  /// A descriptionfor approvedon_date
  final String approvedonDate;

  /// A description for repay_every
  final String repayEvery;

  /// A description for lastName
  final String lastName;

  /// A description for finance
  final double financeCost;

  /// A description for firstName
  final String firstName;

  /// A description for loan_status
  final String loanStatus;

  /// A description for appUserId
  final String appUserId;

  /// A description for disbursedon_date
  final String disbursedonDate;

  /// A description for penalty_charges_repaid_derived
  final String penaltyCharges;

  /// A description for total_expected_costofloan_derived
  final String totalCostofloan;

  /// A descr
  final String interestMethod;

  ///
  final String name;

  ///
  final String momoProvider;

  ///
  final String penaltyChargesoutstanding;

  ///
  final String companyRegistrationDate;

  ///
  final String interestCharged;

  ///
  final String loanType;

  ///
  final double interest;

  /// Creates a copy of the current User with property changes
  Loan copyWith({
    int? id,
    String? totalOustanding,
    String? yearLength,
    String? totalInterest,
    String? title,
    double? currencyDecimals,
    String? mobileNumber,
    double? principalAmountProposed,
    String? feeChargesRepaid,
    String? repaymentAmount,
    String? gender,
    String? status,
    String? writtenoffonDate,
    String? chargesWrittenoff,
    String? approvedonDate,
    String? repayEvery,
    String? lastName,
    double? financeCost,
    String? firstName,
    String? loanStatus,
    String? appUserId,
    String? disbursedonDate,
    String? penaltyCharges,
    String? totalCostofloan,
    String? interestMethod,
    String? name,
    String? momoProvider,
    String? penaltyChargesoutstanding,
    String? companyRegistrationDate,
    String? interestCharged,
    String? loanType,
    double? interest,
  }) {
    return Loan(
      id: id ?? this.id,
      totalOustanding: totalOustanding ?? this.totalOustanding,
      yearLength: yearLength ?? this.yearLength,
      totalInterest: totalInterest ?? this.totalInterest,
      title: title ?? this.title,
      currencyDecimals: currencyDecimals ?? this.currencyDecimals,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      principalAmountProposed:
          principalAmountProposed ?? this.principalAmountProposed,
      feeChargesRepaid: feeChargesRepaid ?? this.feeChargesRepaid,
      repaymentAmount: repaymentAmount ?? this.repaymentAmount,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      writtenoffonDate: writtenoffonDate ?? this.writtenoffonDate,
      chargesWrittenoff: chargesWrittenoff ?? this.chargesWrittenoff,
      approvedonDate: approvedonDate ?? this.approvedonDate,
      repayEvery: repayEvery ?? this.repayEvery,
      lastName: lastName ?? this.lastName,
      financeCost: financeCost ?? this.financeCost,
      firstName: firstName ?? this.firstName,
      loanStatus: loanStatus ?? this.loanStatus,
      appUserId: appUserId ?? this.appUserId,
      disbursedonDate: disbursedonDate ?? this.disbursedonDate,
      penaltyCharges: penaltyCharges ?? this.penaltyCharges,
      totalCostofloan: totalCostofloan ?? this.totalCostofloan,
      interestMethod: interestMethod ?? this.interestMethod,
      name: name ?? this.name,
      momoProvider: momoProvider ?? this.momoProvider,
      penaltyChargesoutstanding:
          penaltyChargesoutstanding ?? this.penaltyChargesoutstanding,
      companyRegistrationDate:
          companyRegistrationDate ?? this.companyRegistrationDate,
      interestCharged: interestCharged ?? this.interestCharged,
      loanType: loanType ?? this.loanType,
      interest: interest ?? this.interest,
    );
  }

  @override
  List<Object?> get props => [
        id,
        totalOustanding,
        yearLength,
        totalInterest,
        title,
        currencyDecimals,
        mobileNumber,
        principalAmountProposed,
        feeChargesRepaid,
        repaymentAmount,
        gender,
        status,
        writtenoffonDate,
        chargesWrittenoff,
        approvedonDate,
        repayEvery,
        lastName,
        financeCost,
        firstName,
        loanStatus,
        appUserId,
        disbursedonDate,
        penaltyCharges,
        totalCostofloan,
        interestMethod,
        name,
        momoProvider,
        penaltyChargesoutstanding,
        companyRegistrationDate,
        interestCharged,
        loanType,
        interest,
      ];

  /// Creates a Json map from a User
  Map<String, dynamic> toJson() => _$LoanToJson(this);

  /// Deserializes the given json Map into a [Loan].
  static Map<String, dynamic> toMap(Map<String, dynamic> json) =>
      _$LoanToMap(json);
}
