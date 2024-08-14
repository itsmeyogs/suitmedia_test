import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier{
  String _name="";
  String get name => _name;

  String _selectedUser="";
  String get selectedUser => _selectedUser;

  void setSelectedUser(String name){
    _selectedUser=name;
    notifyListeners();
  }

  void changeName(String name){
    _name = name;
    notifyListeners();
  }
}