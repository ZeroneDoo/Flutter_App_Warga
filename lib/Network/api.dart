import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future login(String email, String password, String device) async {
  String baseUrl = "https://qi-ra.xyz/api/auth/login";

  try {
    var response = await http.post(Uri.parse(baseUrl),
        body: {"email": email, "password": password, "device_name": device});

    var jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  } catch (e) {
    return e;
  }
}

Future logout(String token) async {
  String baseUrl = "https://qi-ra.xyz/api/auth/logout";

  try {
    var response = await http.post(Uri.parse(baseUrl), headers: {
      "Authorization": "Bearer $token",
      "Accept": "application/json"
    });

    var responseBody = jsonDecode(response.body);

    if(responseBody['message'] != 'failed'){
      return responseBody;
    }

  } catch (e) {
    return e;
  }
}

Future getData(String token) async {
  String baseUrl = "https://qi-ra.xyz/api/auth/warga";

  try {
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      "Authorization": "Bearer $token",
      "Accept": "application/json",
      'Content-Type': 'application/json',
    });

    var responseBody = jsonDecode(response.body);
    return responseBody;
  } catch (e) {
    return e;
  }
}

Future hasToken() async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences local = await _prefs;
  final String? token = local.getString('token_sanctum');
  if (token != null) return token;
  return null;
}

Future setLocalToken(String token) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences local = await _prefs;
  local.setString("token_sanctum", token);
}

Future unsetLocalToken() async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences local = await _prefs;
  local.setString("token_sanctum", "");
}
