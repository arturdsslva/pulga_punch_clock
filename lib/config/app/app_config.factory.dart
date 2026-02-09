import 'package:pulga_punch_clock/config/app/app_config.dart';
import 'package:pulga_punch_clock/config/app/app_env.enum.dart';

class AppConfigFactory {
  static AppConfig fromDefines() {
    final env = _getEnviroment();
    final apiBaseUrl = _getBaseUrl();
    final enableLogs = _getLogsEnabled();

    return AppConfig(
      enviroment: env,
      apiBaseUrl: apiBaseUrl,
      enableLogs: enableLogs,
    );
  }

  static EAppEnviroment _getEnviroment() {
    const env = String.fromEnvironment('ENV');
    switch (env) {
      case 'prod':
        return EAppEnviroment.prod;
      case 'hml':
        return EAppEnviroment.hml;
      case 'dev':
        return EAppEnviroment.dev;
      default:
        throw Exception('Unknown environment: $env');
    }
  }

  static String _getBaseUrl() {
    const baseUrl = String.fromEnvironment('API_BASE_URL');

    if (baseUrl.isEmpty) {
      throw Exception('API_BASE_URL is not defined');
    }

    return baseUrl;
  }

  static bool _getLogsEnabled() {
    const enableLogs = String.fromEnvironment('ENABLE_LOGS');

    if (enableLogs.isEmpty) {
      throw Exception('ENABLE_LOGS is not defined');
    }

    return enableLogs.toLowerCase() == 'true';
  }
}
