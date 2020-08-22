import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
import 'package:highfives_ui/utils/themeChanger.dart';
import 'package:provider/provider.dart';

class NavBarCommon extends StatelessWidget {
  double navBarHeight;
  NavBarCommon(this.navBarHeight);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: navBarHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(0.2),
              blurRadius: 3),
        ],
      ),
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
              Provider.of<ThemeChanger>(context, listen: false).toggleTheme();
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
}

List<Widget> getListOfNavHeadings(BuildContext context) {
  return NAV_HEADLINES.map((headline) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 30, 0, 30),
      child: Text(headline, style: Theme.of(context).textTheme.headline4),
    );
  }).toList();
}
