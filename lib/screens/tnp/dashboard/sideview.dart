import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/sideMenuItems.dart';
import 'package:highfives_ui/constants/const/size.dart';
import 'package:highfives_ui/screens/tnp/dashboard/sidemenumodel.dart';
import 'package:provider/provider.dart';

class SideView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: SIDE_VIEW_WIDTH,
      height: size.height,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor,
            blurRadius: 3,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: _sideMenuItemsList(context),
        ),
      ),
    );
  }
}

//TODO MAKE SEPARATE WIDGET FOR EVERY MENU ITEM AS ICONS AND SOME PROPERTIES ARE TO BE DIFFERENT LIKE FOR COMMUNICATION THERE ARE SUB HEADINGS
//IT IS STILL POSSIBLE IN THIS LOOP BUT SEE LATER
List<Widget> _sideMenuItemsList(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  String selectedItem = Provider.of<SideMenuModel>(context).selectedItem;
  List<Widget> _menuItems = List<Widget>();
  for (int i = 0; i < SIDEMENULIST.length; i++) {
    bool selected = false;

    if (SIDEMENULIST[i] == selectedItem) {
      selected = true;
    }

    String item = SIDEMENULIST[i];

    Widget itemWidget = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Provider.of<SideMenuModel>(context, listen: false)
            .setSideMenuItem(item);
      },
      // color: Colors.orange,
      child: Container(
        width: size.width,
        height: 50,
        color: selected
            ? Theme.of(context).accentColor.withOpacity(0.1)
            : Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.menu,
                    size: 20,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(item, style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
        ),
      ),
    );

    _menuItems.add(itemWidget);
  }
  return _menuItems;
}
