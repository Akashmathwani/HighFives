import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/theme.dart';
import 'package:highfives_ui/constants/const/token.dart';
import 'package:highfives_ui/resources/Identity/main.dart';
import 'package:highfives_ui/screens/home_page/main.dart';
import 'package:highfives_ui/screens/login/login.dart';
import 'package:highfives_ui/utils/themeChanger.dart';
import 'package:provider/provider.dart';
import 'package:highfives_ui/utils/platform.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(LIGHTTHEME),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  final _identityResource = IdentityResource(findPlatform());

  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'HighFives',
      theme: _theme.getTheme(),
      home: FutureBuilder(
        future: _findtoken(TokenType.AccessToken),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data != null && snapshot.data) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainHome()));
          } else {
            //TODO SHOULD BE LOGINUI
            return LoginUI();
          }
        },
      ),
    );
  }

  Future<dynamic> _findtoken(dynamic tokenType) async {
    return await _identityResource.findtoken(tokenType);
  }
}
