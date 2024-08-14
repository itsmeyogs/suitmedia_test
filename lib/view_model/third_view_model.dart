import 'package:flutter/cupertino.dart';
import 'package:suitmedia_test/repository/repository.dart';

import '../model/user.dart';

class ThirdViewModel extends ChangeNotifier{
  final Repository repository = Repository();

  List<User> _data = [];
  bool fetchingData = false;
  List<User> get data => _data;

  Future<void> getData() async{
    fetchingData = true;
    try{
      _data = await repository.getUsers();
      notifyListeners();
    }catch(e){
      throw Exception('Failed to load Users: $e');
    }
    fetchingData = false;
  }


}