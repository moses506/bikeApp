import 'package:equatable/equatable.dart';

part 'config.g.dart';

/// {@template config}
/// Config description
/// {@endtemplate}
class Config extends Equatable {
  /// {@macro config}
  const Config({
    required this.baseUrl,
    required this.dbName,
    required this.host,
    required this.initScript,
    this.migrations = const [],
  });

  /// Creates a Config from Json map
  factory Config.fromJson(Map<String, dynamic> data) => _$ConfigFromJson(data);

  /// Creates a Config from Json map
  factory Config.empty() => const Config(
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
  Config copyWith({
    String? baseUrl,
    String? dbName,
    String? host,
    List<String>? initScript,
    List<String>? migrations,
  }) {
    return Config(
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
  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
