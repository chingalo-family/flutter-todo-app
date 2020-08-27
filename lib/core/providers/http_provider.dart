import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpProvider {
  static Future<User> getCurrentUser() async {
    String username = 'system';
    String password = 'System123';
    String basicAuth = base64Encode(utf8.encode('$username:$password'));
    String url = 'http://play.dhis2.org/2.33/api/me.json';
    final response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Basic $basicAuth"},
    );
    return response.statusCode == 200
        ? User.fromJson(json.decode(response.body))
        : new User(id: '', name: '');
  }
}

class User {
  final String id;
  final String name;

  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      id: json['id'],
    );
  }
}
