

import 'package:equatable/equatable.dart';

part 'balance.g.dart';

/// {@template user}
/// User description
/// {@endtemplate}
class Balance extends Equatable {
  /// {@macro user}
  const Balance({
    required this.id,
    required this.balance,
    required this.companyId,
    required this.customerId,
    required this.firstName,
    required this.lastName,
  });

  /// Creates a User from Json map
  factory Balance.fromJson(Map<String, dynamic> data) => _$BalanceFromJson(data);

  /// A desscription for id
  final int id;
/// A desc ription for balance
final double balance;
/// 
/// A description forcompany_id
final int companyId;
///  adescr for customer
final int customerId;
/// A decr for firstName
final String firstName;
/// A desc for lastName
final String lastName;

  /// Creates a copy of the current User with property changes
  Balance copyWith({
    int? id,
    double? balance,
 int? companyId,
 int ?customerId,
 String? firstName,
 String? lastName,

  /// Creates a copy of 
  }) {
    return Balance(
      id: id ?? this.id,
      balance: balance?? this.balance,
      companyId:  companyId ?? this.companyId,
      customerId:  customerId ?? this.customerId,
      firstName:  firstName?? this.firstName,
      lastName:  lastName ?? this.lastName,
      
    );
  }

  @override
  List<Object?> get props => [
        id,
       balance,
       companyId,customerId,
       firstName,
       lastName,
      ];

  /// Creates a Json map from a User
  Map<String, dynamic> toJson() => _$BalanceToJson(this);

  /// Deserializes the given json Map into a [Bio].
  static Map<String, dynamic> toMap(Map<String, dynamic> json) =>
      _$BalanceToMap(json);
}
