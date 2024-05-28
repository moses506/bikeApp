import 'package:equatable/equatable.dart';

part 'size.g.dart';

/// {@template size}
/// Size description
/// {@endtemplate}
class AdSize extends Equatable {
  /// {@macro size}
  const AdSize({
    required this.id,
    required this.height,
    required this.width,
    required this.status,
    required this.insertedAt,
    required this.updatedAt,
  });

  /// Creates a Size from Json map
  factory AdSize.fromJson(Map<String, dynamic> data) => _$SizeFromJson(data);

  /// A description for id
  final int id;

  /// A description for height
  final String height;

  /// A description for width
  final String width;

  /// A description for status
  final String status;

  /// A description for insertedAt
  final String insertedAt;

  /// A description for updatedAt
  final String updatedAt;

  /// Creates a copy of the current Size with property changes
  AdSize copyWith({
    int? id,
    String? height,
    String? width,
    String? status,
    String? insertedAt,
    String? updatedAt,
  }) {
    return AdSize(
      id: id ?? this.id,
      height: height ?? this.height,
      width: width ?? this.width,
      status: status ?? this.status,
      insertedAt: insertedAt ?? this.insertedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        height,
        width,
        status,
        insertedAt,
        updatedAt,
      ];

  /// Creates a Json map from a Size
  Map<String, dynamic> toJson() => _$SizeToJson(this);

  /// Creates a Json map from a Size
  static Map<String, dynamic> toMap(Map<String, dynamic> map) =>
      _$SizeToMap(map);
}
