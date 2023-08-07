import 'package:http/http.dart' as http;
import 'dart:convert';

class OdooAPI {
  static const AUTH_URL = 'http://localhost:8069/auth/';
  static const API_BASE_URL = 'http://localhost:8069/api/';

  static Future<Map<String, dynamic>> authenticateUser(
      String email, String password, String dbName) async {
    final headers = {'Content-type': 'application/json'};

    final data = {
      'params': {
        'login': 'khalilzaatari1@gmail.com',
        'password': 'khalilzaatari2003',
        'db': 'odoo16',
      }
    };

    final response = await http.post(
      Uri.parse(AUTH_URL),
      body: jsonEncode(data),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to authenticate user');
    }
  }

  static Future<List<Map<String, dynamic>>> getUsers(String authToken) async {
    final USERS_URL = API_BASE_URL + 'res.users/';
    final headers = {'Content-type': 'application/json', 'Cookie': authToken};

    final response = await http.get(
      Uri.parse(USERS_URL),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      return decodedResponse['result']['records'];
    } else {
      throw Exception('Failed to get users');
    }
  }
}
