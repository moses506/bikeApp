import 'package:equatable/equatable.dart';

part 'pay_config.g.dart';

/// {@template config}
/// Config description
/// {@endtemplate}
class PayConfig extends Equatable {
  /// {@macro config}
  const PayConfig({
    required this.baseUrl,
    required this.dbName,
    required this.host,
    required this.initScript,
    this.migrations = const [],
  });

  /// Creates a Config from Json map
  factory PayConfig.fromJson(Map<String, dynamic> data) =>
      _$PayConfigFromJson(data);

  /// Creates a Config from Json map
  factory PayConfig.empty() => const PayConfig(
        baseUrl: '',
        dbName: '',
        host: '',
        initScript: [],
      );

  /// A description for baseUrl
  final String baseUrl;

  /// A description for dbName
  final String dbName;

  /// A description for host
  final String host;

  /// A description for initScript
  final List<String> initScript;

  /// A description for migrations
  final List<String> migrations;

  /// Creates a copy of the current Config with property changes
  PayConfig copyWith({
    String? baseUrl,
    String? dbName,
    String? host,
    List<String>? initScript,
    List<String>? migrations,
  }) {
    return PayConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      dbName: dbName ?? this.dbName,
      host: host ?? this.host,
      initScript: initScript ?? this.initScript,
      migrations: migrations ?? this.migrations,
    );
  }

  @override
  List<Object?> get props => [
        baseUrl,
        dbName,
        host,
        initScript,
        migrations,
      ];

  /// Creates a Json map from a Config
  Map<String, dynamic> toJson() => _$PayConfigToJson(this);
}
