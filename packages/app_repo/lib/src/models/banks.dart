
import 'package:equatable/equatable.dart';

part 'banks.g.dart';

/// {@template user}
/// User description
/// {@endtemplate}
class Bank extends Equatable {
  /// {@macro user}
  const Bank({
    required this.id,
    required this.acronym,
    required this.bankCode,
    required this.bankDescript,
    required this.bankName,
    required this.centerCode,
    required this.processBranch,
  });

  /// Creates a User from Json map
  factory Bank.fromJson(Map<String, dynamic> data) => _$BioFromJson(data);

  /// A desscription for id
  final int id;

  /// A description for bankName
  final String bankName;

  /// A description for process_branch
  final String processBranch;

  /// A description for center_code
  final String centerCode;

  /// A description for bank_descrip
  final String bankDescript;

  /// A description for bank_code
  final String bankCode;

  /// A description for acronym
  final String acronym;

  /// Creates a copy of the current User with property changes
  Bank copyWith({
    int? id,
    String? bankName,
    String? processBranch,
    String? centerCode,
    String? bankDescript,
    String? bankCode,
    String? acronym,
  }) {
    return Bank(
      id: id ?? this.id,
      bankName: bankName ?? this.bankName,
      processBranch: processBranch ?? this.processBranch,
      centerCode: centerCode ?? this.centerCode,
      bankCode: bankCode ?? this.bankCode,
      acronym: acronym ?? this.acronym,
      bankDescript: bankDescript ?? this.bankDescript,
    );
  }

  @override
  List<Object?> get props => [
        id,
        bankName,
        processBranch,
        centerCode,
        bankCode,
        acronym,
        bankDescript,
      ];

  /// Creates a Json map from a User
  Map<String, dynamic> toJson() => _$BioToJson(this);

  /// Deserializes the given json Map into a [Bio].
  static Map<String, dynamic> toMap(Map<String, dynamic> json) =>
      _$BioToMap(json);
}
