part of 'pay_config.dart';

PayConfig _$PayConfigFromJson(Map<String, dynamic> json) => PayConfig(
      baseUrl: json['baseUrl'] as String,
      dbName: json['dbName'] as String,
      host: json['host'] as String,
      initScript: json['initScript'] as List<String>,
      migrations: json['migrations'] as List<String>,
    );

Map<String, dynamic> _$PayConfigToJson(PayConfig instance) => <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'dbName': instance.dbName,
      'host': instance.host,
      'initScript': instance.initScript,
      'migrations': instance.migrations,
    };
