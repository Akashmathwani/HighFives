import 'package:flutter/material.dart';

class RoleChanger with ChangeNotifier {
  String _role;
  int _roleIndex;
  RoleChanger(this._role, this._roleIndex);
  get role => _role;
  get roleIndex => _roleIndex;
  setRole(String role, int roleIndex) {
    this._role = role;
    this._roleIndex = roleIndex;
    notifyListeners();
  }
}
