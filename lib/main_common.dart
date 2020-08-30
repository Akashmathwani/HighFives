import 'package:flutter/material.dart';
import 'package:highfives_ui/app_start.dart';
import 'package:highfives_ui/config_reader.dart';
import 'package:highfives_ui/environment.dart';
import 'package:provider/provider.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();

  Color primaryColor;
  switch (env) {
    case Environment.dev:
      primaryColor = Colors.red;
      break;
    case Environment.prod:
      primaryColor = Colors.blue;
      break;
  }

  runApp(Provider.value(value: primaryColor, child: MyApp()));
}
