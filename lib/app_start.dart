import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/token.dart';
import 'package:highfives_ui/resources/Identity/main.dart';
import 'package:highfives_ui/screens/home_page/main.dart';
import 'package:highfives_ui/screens/login/demo_login.dart';
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
          if(!snapshot.hasData) return CircularProgressIndicator();
          if(snapshot.data != null && snapshot.data) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainHome()));
          }else {
            return DemoLogin();
          }
        }
      ),
    );
  }

  Future<dynamic> _findtoken(dynamic tokenType) async {
    return await _identityResource.findtoken(tokenType);
  }

}
