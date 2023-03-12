import 'dart:convert';

import '../../data/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<Map<String, dynamic>> getDataUser() async {
    try {
      Uri url = Uri.parse('https://reqres.in/api/users');
      var response = await http.get(url);

      if (response.statusCode != 200) {
        return {
          "error": true,
          "message": "${response.statusCode}",
        };
      }

      Map<String, dynamic> body = jsonDecode(response.body);

      return {
        "error": false,
        "message": "Success get user data",
        "data": User.fromJson(body)
      };
    } catch (e) {
      return {
        "error": true,
        "message": "$e",
      };
    }
  }
}
