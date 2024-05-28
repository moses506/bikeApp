import 'package:equatable/equatable.dart';

part 'area.g.dart';

/// {@template area}
/// Area description
/// {@endtemplate}
class Area extends Equatable {
  /// {@macro area}
  const Area({
    required this.id,
    required this.name,
    required this.code,
    required this.status,
    required this.insertedAt,
    required this.updatedAt,
  });

  /// Creates a Area from Json map
  factory Area.fromJson(Map<String, dynamic> data) => _$AreaFromJson(data);

  /// A description for id
  final int id;

  /// A description for name
  final String name;

  /// A description for code
  final String code;

  /// A description for status
  final String status;

  /// A description for insertedAt
  final String insertedAt;

  /// A description for updatedAt
  final String updatedAt;

  /// Creates a copy of the current Area with property changes
  Area copyWith({
    int? id,
    String? name,
    String? code,
    String? status,
    String? insertedAt,
    String? updatedAt,
  }) {
    return Area(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      status: status ?? this.status,
      insertedAt: insertedAt ?? this.insertedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        status,
        insertedAt,
        updatedAt,
      ];

  /// Creates a Json map from a Area
  Map<String, dynamic> toJson() => _$AreaToJson(this);

  /// Creates a Json map from a Area
  static Map<String, dynamic> toMap(Map<String, dynamic> map) =>
      _$AreaToMap(map);
}
