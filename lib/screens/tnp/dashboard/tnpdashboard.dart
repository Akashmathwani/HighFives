import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/sideMenuItems.dart';
import 'package:highfives_ui/constants/const/size.dart';
import 'package:highfives_ui/screens/employer/profile/employer_profile.dart';
import 'package:highfives_ui/screens/tnp/communications/manage_existing/view.dart';
import 'package:highfives_ui/screens/tnp/dashboard/sideview.dart';
import 'package:highfives_ui/screens/tnp/dashboard/sidemenumodel.dart';
import 'package:highfives_ui/screens/tnp/profile/profile.dart';
import 'package:highfives_ui/screens/utils/navbar.dart';
import 'package:provider/provider.dart';

class TnpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<SideMenuModel>(
      //By default build Profile
      create: (_) => SideMenuModel(0),
      child: TnpDashBoard(),
    );
  }
}

class TnpDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Now get the menu item selected on basis of sideMenu and build sideView and dashboard body
    final item = Provider.of<SideMenuModel>(context).selectedItem;
    Size size = MediaQuery.of(context).size;
    double navBarHeight = 100;
    return Builder(
      builder: (context) {
        return new Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            child: ListView(
              children: [
                NavBarCommon(navBarHeight),
                Container(
                  width: size.width,
                  height: size.height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SideView(),
                      DashBoardBody(item),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DashBoardBody extends StatelessWidget {
  String _menuItem;
  DashBoardBody(this._menuItem);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _getSelectedWidget(_menuItem, context);
  }
}

Widget _getSelectedWidget(String menuItem, BuildContext context) {
  Widget childWidget;

  //TODO THIS COMMUNICATION HAS SOME CATEGORIES
  if (menuItem != null && menuItem == SIDEMENULIST[1]) {
    childWidget = ExistingRelations();
  }

  if (menuItem != null && menuItem == PROFILE) {
    childWidget = TnpProfile();
  }

  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width - SIDE_VIEW_WIDTH,
    height: size.height,
    // padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Theme.of(context).accentColor.withOpacity(0.05),

      // boxShadow: [
      //   BoxShadow(
      //     blurRadius: 3,
      //   ),
      // ],
    ),
    // color: Theme.of(context).accentColor.withOpacity(0.05),
    // padding: EdgeInsets.all(40),
    child: childWidget,
  );

  // if (menuItem != null && menuItem == SIDEMENULIST[2]) {
  //   return BuildOnGoingInterview();
  // }
  // if (menuItem != null && menuItem == SIDEMENULIST[3]) {
  //   return BuildStudentsView();
  // }
  // if (menuItem != null && menuItem == SIDEMENULIST[4]) {
  //   return BuildAnalytics();
  // }
  // if (menuItem != null && menuItem == SIDEMENULIST[5]) {
  //   return BuildHelp();
  // }
}
