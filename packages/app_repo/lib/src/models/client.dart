import 'package:equatable/equatable.dart';

part 'client.g.dart';

/// {@template client}
/// Client description
/// {@endtemplate}
class Client extends Equatable {
  /// {@macro client}
  const Client({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.registrationNumber,
    required this.telephoneNumber,
    required this.town,
    required this.email,
    required this.country,
    required this.businessType,
    required this.address,
    required this.incorporationDate,
    required this.status,
    required this.insertedAt,
    required this.updatedAt,
  });

  /// Creates a Client from Json map
  factory Client.fromJson(Map<String, dynamic> data) => _$ClientFromJson(data);

  /// A description for id
  final int id;

  /// A description for name
  final String name;

  /// A description for phoneNumber
  final String phoneNumber;

  /// A description for registrationNumber
  final String registrationNumber;

  /// A description for telephoneNumber
  final String telephoneNumber;

  /// A description for town
  final String town;

  /// A description for email
  final String email;

  /// A description for country
  final String country;

  /// A description for businessType
  final String businessType;

  /// A description for address
  final String address;

  /// A description for incorporationDate
  final String incorporationDate;

  /// A description for status
  final String status;

  /// A description for insertedAt
  final String insertedAt;

  /// A description for updatedAt
  final String updatedAt;

  /// Creates a copy of the current Client with property changes
  Client copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? registrationNumber,
    String? telephoneNumber,
    String? town,
    String? email,
    String? country,
    String? businessType,
    String? address,
    String? incorporationDate,
    String? status,
    String? insertedAt,
    String? updatedAt,
  }) {
    return Client(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
      town: town ?? this.town,
      email: email ?? this.email,
      country: country ?? this.country,
      businessType: businessType ?? this.businessType,
      address: address ?? this.address,
      incorporationDate: incorporationDate ?? this.incorporationDate,
      status: status ?? this.status,
      insertedAt: insertedAt ?? this.insertedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phoneNumber,
        registrationNumber,
        telephoneNumber,
        town,
        email,
        country,
        businessType,
        address,
        incorporationDate,
        status,
        insertedAt,
        updatedAt,
      ];

  /// Creates a Json map from a Client
  Map<String, dynamic> toJson() => _$ClientToJson(this);

  /// Creates a Json map from a Client
  static Map<String, dynamic> toMap(Map<String, dynamic> map) =>
      _$ClientToMap(map);
}
