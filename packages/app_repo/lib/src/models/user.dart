import 'package:equatable/equatable.dart';

part 'user.g.dart';

/// {@template user}
/// User description
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    required this.emailAddress,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.meansOfIdentificationType,
    required this.mobileNumber,
    required this.otherName,
    required this.userId,
  });

  /// Creates a User from Json map
  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  /// Creates a User from Json map
  static const empty = User(
    id: 0,
    emailAddress: '',
    firstName: '',
    gender: '',
    lastName: '',
    meansOfIdentificationType: '',
    mobileNumber: '',
    otherName: '',
    userId: 0,
  );

  /// A description for id
  final int id;

  /// a descripton for firstName
  final String firstName;

  /// A description for lastName
  final String lastName;

  /// A description for otherName
  final String otherName;

  /// A description for meansOfIdentificationType
  final String meansOfIdentificationType;

  /// Adescription for gender
  final String gender;

  ///   A description for mobileNumber
  final String mobileNumber;

  /// A description for emailAddress
  final String emailAddress;

  ///  A description for userId
  final int userId;

  /// A descrtiption for company_id

  /// Creates a copy of the current User with property changes
  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? otherName,
    String? dateOfBirth,
    String? meansOfIdentificationType,
    String? title,
    String? gender,
    String? mobileNumber,
    String? emailAddress,
    int? userId,
    String? loanLimit,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      otherName: otherName ?? this.otherName,
      gender: gender ?? this.gender,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      meansOfIdentificationType:
          meansOfIdentificationType ?? this.meansOfIdentificationType,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        otherName,
        gender,
        mobileNumber,
        emailAddress,
        meansOfIdentificationType,
        meansOfIdentificationType,
        userId,
      ];

  /// Creates a Json map from a User
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// Deserializes the given json Map into a [User].
  static Map<String, dynamic> toMap(Map<String, dynamic> json) =>
      _$UserToMap(json);
}
