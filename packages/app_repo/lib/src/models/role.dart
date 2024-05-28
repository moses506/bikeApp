import 'package:equatable/equatable.dart';

part 'role.g.dart';

/// {@template user}
/// User description
/// {@endtemplate}
class Role extends Equatable {
  /// {@macro user}
  const Role({
    required this.id,
    required this.roleType,
    required this.status,
    required this.userId,
    required this.otp,
  });

  /// Creates a User from Json map
  factory Role.fromJson(Map<String, dynamic> data) => _$RoleFromJson(data);

  /// Creates a User from Json map
  static const empty = Role(
    id: 0,
   roleType: '',
   status: '',
   userId: '',
   otp:'',
  );

 /// A description for id
 final int id;
 ///  A description for otp
 final String otp;
 ///
 final String roleType;
 /// A decsription for status
 final String status;
 /// A description for userId
 final String userId;

  /// Creates a copy of the current User with property changes
  Role copyWith({
    int? id,
    String? otp,
    String? roleType,
    String? status,
    String? userId,

  }) {
    return Role(
      id: id ?? this.id,
     otp: otp?? this.otp,
     roleType: roleType ?? this.roleType,
     userId: userId ?? this.userId,
     status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        id,
        otp,
        roleType,
        status,
        userId,
       
      ];

  /// Creates a Json map from a User
  Map<String, dynamic> toJson() => _$RoleToJson(this);

  /// Deserializes the given json Map into a [Role].
  static Map<String, dynamic> toMap(Map<String, dynamic> json) =>
      _$RoleToMap(json);
}
