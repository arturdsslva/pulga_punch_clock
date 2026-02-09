import 'package:pulga_punch_clock/config/app/app_env.enum.dart';

class AppConfig {
  final EAppEnviroment enviroment;
  final String apiBaseUrl;
  final bool enableLogs;
  const AppConfig({
    required this.enviroment,
    required this.apiBaseUrl,
    required this.enableLogs,
  });
}
