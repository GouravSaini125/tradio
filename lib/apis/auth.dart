import 'dart:io';

import 'package:http/http.dart' as http;

class Auth {

    static var url = "base";

    static Future<bool> login(String email, String password) async {
        var payload = {
            email: email,
            password: password
        };
        final response = await http.post(
            url + 'login',
            headers: {
                HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: payload,
        );
        return response.statusCode == 200;
    }

    static Future<dynamic> register(String name, String email, String password) async {
        var payload = {
            name: name,
            email: email,
            password: password
        };
        return await http.post(
            url + 'register',
            headers: {
                HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: payload,
        );
    }

}