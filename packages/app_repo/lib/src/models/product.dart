import 'package:equatable/equatable.dart';

part 'product.g.dart';

/// {@template user}
/// User description
/// {@endtemplate}
class Product extends Equatable {
  /// {@macro user}
  const Product({
    required this.id,
    required this.arrangementFee,
    required this.chargesId,
    required this.classificationId,
    required this.clientId,
    required this.code,
    required this.currencyDecimals,
    required this.currencyId,
    required this.currencyName,
    required this.defaultPeriod,
    required this.details,
    required this.financeCost,
    required this.interest,
    required this.interestMode,
    required this.interestType,
    required this.interestId,
    required this.maximumPrincipal,
    required this.minimumPrincipal,
    required this.name,
    required this.periodType,
    required this.principleId,
    required this.productType,
    required this.reason,
    required this.referenceId,
    required this.status,
    required this.yearLengthInDays,
  });

  /// Creates a User from Json map
  factory Product.fromJson(Map<String, dynamic> data) =>
      _$ProductFromJson(data);

  /// A desscription for id
  final int id;

  /// A descriotion for arrangement_fee
  final double arrangementFee;

  /// A description for charges_account_id
  final int chargesId;

  /// A description for classification_id
  final int classificationId;

  /// A decription for clientId
  final int clientId;

  /// A description for code
  final String code;

  /// A description for currencyDecimals
  final double currencyDecimals;

  /// A description for currencyId
  final int currencyId;

  /// A description for currencyName
  final String currencyName;

  /// A description for defaultPeriod
  final int defaultPeriod;

  /// a descriptiuon for details
  final String details;

  /// A description for finance_cost
  final double financeCost;

  /// a descriptiuon for interest
  final double interest;
  //// A description for interestMode
  final String interestMode;

  /// A desription for interestType
  final int interestType;

  /// A decription for interest_account_id
  final int interestId;

  /// A decription for maximumPrincipal
  final double maximumPrincipal;

  /// a description for minimumPrincipal
  final double minimumPrincipal;

  /// A description for name
  final String name;

  ///  A description for periodType
  final String periodType;

  /// A description for principle_account_id
  final int principleId;

  /// A dscription for productType
  final String productType;

  /// A description for reason
  final String reason;
  //// A description reference_id
  final int referenceId;

  /// A description for status
  final String status;

  /// A description for yearLengthInDays
  final int yearLengthInDays;

  /// Creates a copy of the current User with property changes
  Product copyWith({
    int? id,
    double? arrangementFee,
    int? chargesId,
    int? classificationId,
    int? clientId,
    String? code,
    double? currencyDecimals,
    int? currencyId,
    String? currencyName,
    int? defaultPeriod,
    String? details,
    double? financeCost,
    double? interest,
    String? interestMode,
    int? interestType,
    int? interestId,
    double? maximumPrincipal,
    double? minimumPrincipal,
    String? name,
    String? periodType,
    int? principleId,
    String? productType,
    String? reason,
    int? referenceId,
    String? status,
    int? yearLengthInDays,
  }) {
    return Product(
      id: id ?? this.id,
      arrangementFee: arrangementFee ?? this.arrangementFee,
      chargesId: chargesId ?? this.chargesId,
      classificationId: classificationId ?? this.classificationId,
      clientId: clientId ?? this.clientId,
      code: code ?? this.code,
      currencyDecimals: currencyDecimals ?? this.currencyDecimals,
      currencyId: currencyId ?? this.currencyId,
      currencyName: currencyName ?? this.currencyName,
      defaultPeriod: defaultPeriod ?? this.defaultPeriod,
      details: details ?? this.details,
      financeCost: financeCost ?? this.financeCost,
      interest: interest ?? this.interest,
      interestMode: interestMode ?? this.interestMode,
      interestType: interestType ?? this.interestType,
      interestId: interestId ?? this.interestId,
      maximumPrincipal: maximumPrincipal ?? this.maximumPrincipal,
      minimumPrincipal: minimumPrincipal ?? this.minimumPrincipal,
      name: name ?? this.name,
      periodType: periodType ?? this.periodType,
      reason: reason ?? this.reason,
      referenceId: referenceId ?? this.referenceId,
      status: status ?? this.status,
      yearLengthInDays: yearLengthInDays ?? this.yearLengthInDays,
      principleId: principleId ?? this.principleId,
      productType: productType ?? this.productType,
    );
  }

  @override
  List<Object?> get props => [
        id,
        arrangementFee,
        chargesId,
        classificationId,
        clientId,
        code,
        currencyDecimals,
        currencyId,
        currencyName,
        defaultPeriod,
        details,
        financeCost,
        interest,
        interestMode,
        interestType,
        interestId,
        maximumPrincipal,
        minimumPrincipal,
        name,
        periodType,
        reason,
        referenceId,
        status,
        yearLengthInDays,
        principleId,
        productType,
      ];

  /// Creates a Json map from a User
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  /// Deserializes the given json Map into a [Bio].
  static Map<String, dynamic> toMap(Map<String, dynamic> json) =>
      _$ProductToMap(json);
}
