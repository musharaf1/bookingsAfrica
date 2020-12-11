import 'dart:convert';
import 'package:bookingsAfricaApp/core/models/user.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  String url = 'https://reqres.in/api/users';

  Future<List<UserModel>> getUserList() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> fetchedData = json.decode(response.body)['data'];
      List<UserModel> users =
          fetchedData.map((product) => UserModel.fromJson(product)).toList();
      return users;
    } else {
      print(response.statusCode);
      throw 'error fetching users';
    }
  }
}
