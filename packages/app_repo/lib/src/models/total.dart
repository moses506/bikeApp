import 'package:equatable/equatable.dart';

part 'total.g.dart';

/// {@template size}
/// Size description
/// {@endtemplate}
class Total extends Equatable {
  /// {@macro size}
  const Total({
    required this.id,
    required this.totalCount,
    required this.totalValue,
  });

  /// Creates a Size from Json map
  factory Total.fromJson(Map<String, dynamic> data) => _$TotalFromJson(data);

  /// A description for id
  final int id;

  // A description for total_count
  final int totalCount;

  ///  A description for total_value
  final double totalValue;

  /// Creates a copy of the current Size with property changes
  Total copyWith({
    int? id,
    int? totalCount,
    double? totalValue,
  }) {
    return Total(
        id: id ?? this.id,
        totalValue: totalValue ?? this.totalValue,
        totalCount: totalCount ?? this.totalCount);
  }

  @override
  List<Object?> get props => [
        id,
        totalValue,
        totalCount,
      ];

  /// Creates a Json map from a Size
  Map<String, dynamic> toJson() => _$TotalToJson(this);

  /// Creates a Json map from a Size
  static Map<String, dynamic> toMap(Map<String, dynamic> map) =>
      _$TotalToMap(map);
}
