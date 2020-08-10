import 'dart:js';

import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/constants/const/theme.dart';
import 'package:highfives_ui/screens/login/logic.dart';
import 'package:highfives_ui/utils/themeChanger.dart';
import 'package:provider/provider.dart';

class LoginUI extends StatelessWidget {
  ThemeChanger _themeChanger;
  @override
  Widget build(BuildContext context) {
    _themeChanger = Provider.of<ThemeChanger>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            _buildTopNavBar(context),
            SizedBox(height: 100),
            _buildLoginBody(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNavBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(0.2),
              blurRadius: 3),
        ],
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
              Text(
                COMPANY_NAME,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              _themeChanger.setTheme(DARKTHEME);
            },
            child: Icon(Icons.access_alarms,
                size: 40, color: Theme.of(context).accentColor),
          ),
          Row(
            children: [...getListOfNavHeadings(context)]..add(
                InkWell(
                  onTap: () async {
                    //TODO ONCLICK
                    return null;
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(50, 30, 100, 30),
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(8.3),
                      border: Border.all(
                          color: Theme.of(context).accentColor, width: 1.667),
                    ),
                    child: Center(
                      child: Text('Sign Up',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }

  List<Widget> getListOfNavHeadings(BuildContext context) {
    return NAV_HEADLINES.map((headline) {
      return Padding(
        padding: EdgeInsets.fromLTRB(40, 30, 0, 30),
        child: Text(headline, style: Theme.of(context).textTheme.headline4),
      );
    }).toList();
  }

  Widget _buildLoginBody(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.bottomLeft,
            widthFactor: 0.55,
            child: Container(
              // color: Colors.orange,
              child: Image(
                image: AssetImage("assets/images/people_highfive.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: 0.45,
            child: Container(
              // color: Colors.green,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Text('Welcome back !',
                        style: Theme.of(context).textTheme.headline2),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Don\'t miss out an opportunity ',
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    SizedBox(height: 87),
                    LoginLogic(),
                    //submit login
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
