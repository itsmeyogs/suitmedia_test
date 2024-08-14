import 'dart:convert';

import 'package:suitmedia_test/service/api_service.dart';

import '../model/user.dart';

class Repository{
  final apiService = ApiService();

  Future<List<User>> getUsers() async{

    try{
      final response = await apiService.fetchData();
      if(response.statusCode==200){
        return UserResponse.fromJson(jsonDecode(response.body)).data;
      }else{
        throw Exception('Failed to load users');
      }
    }catch(e){
      rethrow;
    }
  }

}