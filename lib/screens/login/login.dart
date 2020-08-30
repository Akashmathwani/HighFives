import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/screens/login/logic.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopNavBar(context),
              _buildLoginBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopNavBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
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
              _themeChanger.toggleTheme();
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.3),
                border:
                    Border.all(color: Theme.of(context).dividerColor, width: 1),
              ),
              child: Icon(Icons.brightness_3,
                  size: 40, color: Theme.of(context).accentColor),
            ),
          ),
          if (ResponsiveLayout.isSmallScreen(context))
            Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.menu,
                color: Theme.of(context).accentColor,
                size: 40,
              ),
            )
          else
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
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}

class LargeChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        SizedBox(
          height: 600,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                alignment: Alignment.bottomLeft,
                widthFactor: 0.55,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 1, color: Theme.of(context).dividerColor)),
                  ),
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
        ),
      ],
    );
  }
}

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedBox(
              alignment: Alignment.centerRight,
              widthFactor: 1,
              child: Container(
                // color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome back !',
                        style: Theme.of(context).textTheme.headline2),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Don\'t miss out an opportunity ',
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    SizedBox(height: 30), //submit login
                  ],
                ),
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomLeft,
              widthFactor: 0.8,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Image(
                    image: AssetImage("assets/images/people_highfive.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: LoginLogic(),
            ),
          ],
        ),
      ),
    );
  }
}
