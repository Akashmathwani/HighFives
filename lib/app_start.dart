import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/token.dart';
import 'package:highfives_ui/resources/Identity/main.dart';
import 'package:highfives_ui/routing/route.dart';
import 'package:highfives_ui/screens/home_page/main.dart';
import 'package:highfives_ui/screens/loading.dart';
import 'package:highfives_ui/screens/login/demo_login.dart';
import 'package:highfives_ui/utils/404.dart';
import 'package:provider/provider.dart';
import 'package:highfives_ui/utils/platform.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _identityResource = IdentityResource(findPlatform());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HighFives',
      theme: ThemeData(
        primarySwatch: Provider.of<Color>(context),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
          future: _findtoken(TokenType.AccessToken),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Loading();
            if (snapshot.data != null && snapshot.data) {
              return MainHome();
            } else {
              return DemoLogin();
            }
          }),
      // routes: {
      //   Loading.route :
      // },
      onGenerateRoute: Path.onGenerateRoute,
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (context) => UnknownPage(
          name: settings.name,
        ),
      ),
    );
  }

  Future<dynamic> _findtoken(dynamic tokenType) async {
    return await _identityResource.findtoken(tokenType);
  }
}
