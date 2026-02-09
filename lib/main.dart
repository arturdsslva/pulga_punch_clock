import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pulga_punch_clock/config/app/app_config.dart';
import 'package:pulga_punch_clock/config/app/app_config.factory.dart';
import 'package:pulga_punch_clock/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final appConfig = AppConfigFactory.fromDefines();

  runApp(PulgaPunchClock(appConfig: appConfig));
}

class PulgaPunchClock extends StatelessWidget {
  final AppConfig appConfig;
  const PulgaPunchClock({super.key, required this.appConfig});

  @override
  Widget build(BuildContext context) {
    final title = appConfig.enviroment.toString();
    return MaterialApp(
      title: title,
      home: TestHome(config: appConfig),
    );
  }
}

class TestHome extends StatelessWidget {
  final AppConfig config;
  const TestHome({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API: ${config.apiBaseUrl}')),
      body: Center(
        child: Text(
          'Ambiente: ${config.enviroment.name}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
