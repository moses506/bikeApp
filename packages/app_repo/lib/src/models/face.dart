import 'package:equatable/equatable.dart';

part 'face.g.dart';

/// {@template face}
/// Face description
/// {@endtemplate}
class Face extends Equatable {
  /// {@macro face}
  const Face({
    required this.id,
    required this.number,
    required this.status,
    required this.insertedAt,
    required this.updatedAt,
  });

  /// Creates a Face from Json map
  factory Face.fromJson(Map<String, dynamic> data) => _$FaceFromJson(data);

  /// A description for id
  final int id;

  /// A description for number
  final int number;

  /// A description for status
  final String status;

  /// A description for insertedAt
  final String insertedAt;

  /// A description for updatedAt
  final String updatedAt;

  /// Creates a copy of the current Face with property changes
  Face copyWith({
    int? id,
    int? number,
    String? status,
    String? insertedAt,
    String? updatedAt,
  }) {
    return Face(
      id: id ?? this.id,
      number: number ?? this.number,
      status: status ?? this.status,
      insertedAt: insertedAt ?? this.insertedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        number,
        status,
        insertedAt,
        updatedAt,
      ];

  /// Creates a Json map from a Face
  Map<String, dynamic> toJson() => _$FaceToJson(this);

  /// Creates a Json map from a Face
  static Map<String, dynamic> toMap(Map<String, dynamic> map) =>
      _$FaceToMap(map);
}
