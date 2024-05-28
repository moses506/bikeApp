part of 'place.dart';

Places _$PlacesFromJson(Map<String, dynamic> json) => Places(
      id: json['id'] as int? ??0,
      image: json['image']as String? ??'',
      latitude: double.tryParse(json['latitude'].toString())??0.0,
      longitude: double.tryParse(json['longitude'].toString())??0.0,
      street: json['street']as String? ??'',
      type:  json['type']as String? ??'',
      name: json['name']as String? ??'',
      
    );

Map<String, dynamic> _$PlacesToJson(Places instance) => <String, dynamic>{
      'id': instance.id,
     'image':instance.image,
     'latitude':instance.latitude,
     'longitude':instance.latitude,
     'street':instance.street,
     'type':instance.type,
     'name':instance.name,
    };

Map<String, dynamic> _$PlacesToMap(Map<String, dynamic> map) =>
    <String, dynamic>{
      'id': map['id'],
      
    };
