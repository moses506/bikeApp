import 'package:equatable/equatable.dart';

part 'bio.g.dart';

/// {@template user}
/// User description
/// {@endtemplate}
class Bio extends Equatable {
  /// {@macro user}
  const Bio({
    required this.id,
    required this.clientId,
    required this.commecialUtilityID,
    required this.status,
    required this.userName,
  });

  /// Creates a User from Json map
  factory Bio.fromJson(Map<String, dynamic> data) => _$BioFromJson(data);

  /// Creates a User from Json map
  static const empty = Bio(
    id: 0,
   clientId: 0,
   commecialUtilityID: '',
   status: '',
   userName: '',

  );

 /// A description for id
 final int id;
 ///  A description for client_id
 final int clientId;
 /// A description for commecialUtilityID
 final String commecialUtilityID;
 /// A description for status
 final String status;
 /// A description for username
 final String userName;
 

  /// Creates a copy of the current User with property changes
  Bio copyWith({
    int? id,
    int? clientId,
  String ? commecialUtilityID,
  String ? status,
  String? userName,


  }) {
    return Bio(
      id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    userName:  userName ?? this.userName,
    commecialUtilityID: commecialUtilityID?? this.commecialUtilityID,
     status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        id,
        clientId,
        userName,
        commecialUtilityID,
       
        status,
      
       
      ];

  /// Creates a Json map from a User
  Map<String, dynamic> toJson() => _$BioToJson(this);

  /// Deserializes the given json Map into a [Bio].
  static Map<String, dynamic> toMap(Map<String, dynamic> json) =>
      _$BioToMap(json);
}
