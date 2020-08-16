import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/theme.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  getTheme() => _themeData;
  setTheme(ThemeData theme) {
    this._themeData = theme;

    notifyListeners();
  }

  toggleTheme() {
    if (this._themeData == DARKTHEME) {
      this._themeData = LIGHTTHEME;
    } else {
      this._themeData = DARKTHEME;
    }
    notifyListeners();
  }
}
