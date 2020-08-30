import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/sideMenuItems.dart';

class SideMenuModel extends ChangeNotifier {
  SideMenuModel(this._selectedIndex) {
    _menuItem = SIDEMENULIST[_selectedIndex];
  }
  String _menuItem;
  int _selectedIndex;

  get selectedItem => _menuItem;
  setSideMenuItem(String item) {
    _selectedIndex = SIDEMENULIST.indexOf(item);
    if (_selectedIndex < 0) Error();
    _menuItem = item;
    notifyListeners();
  }
}
