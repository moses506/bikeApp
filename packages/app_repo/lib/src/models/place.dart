

import 'package:equatable/equatable.dart';

part 'place.g.dart';

/// {@template size}
/// Size description
/// {@endtemplate}
class Places extends Equatable {
  /// {@macro size}
  const Places({
    required this.id,
   required this.image,
   required this.latitude,
   required this.longitude,
   required this.street,
   required this.type,
   required this.name,

  });

  /// Creates a Size from Json map
  factory Places.fromJson(Map<String, dynamic> data) => _$PlacesFromJson(data);

  /// A description for id
  final int id;



  /// A decription for image 
  final String image;
  /// A description for longitude 
  final double latitude;
  /// A desription for longitude
  final double longitude;
  /// A description for street
  final String street;
  /// A desciption for types
  final String type;
  /// A description for name 
  final String name;



  /// Creates a copy of the current Size with property changes
  Places copyWith({
    int? id,
   String? image,
   double? latitude,
   double? longitude,
String? type,
   String? street,
   String? name,
  }) {
    return Places(
        id: id ?? this.id,
        image: image?? this.image,
        latitude: latitude?? this.latitude,
        longitude:  longitude?? this.longitude,
        street: street?? this.street,
        type: type?? this.type,
        name: name?? this.name,
        
        );
  }

  @override
  List<Object?> get props => [
        id,
        image,
        latitude,
        longitude,
        street,
        type,
        name,

     
      ];

  /// Creates a Json map from a Size
  Map<String, dynamic> toJson() => _$PlacesToJson(this);

  /// Creates a Json map from a Size
  static Map<String, dynamic> toMap(Map<String, dynamic> map) =>
      _$PlacesToMap(map);
}
