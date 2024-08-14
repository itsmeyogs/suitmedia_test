import 'package:http/http.dart' as http;

class ApiService{
  final String apiUrl = "https://reqres.in/api/users?page=1&per_page=10";

  Future<http.Response> fetchData() async{
   return await http.get(Uri.parse(apiUrl));
  }
}