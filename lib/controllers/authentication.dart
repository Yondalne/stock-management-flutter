import 'dart:convert';

import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:http/http.dart' as http;
import 'package:stock_management/constants/constants.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;

  Future register({
    required String name,
    required String email,
    required String contact,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      var data = {
        'name': name,
        'email': email,
        'password': password,
        'contact': contact,
      };

      var response = await http.post(
        Uri.parse(url + '/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'password': password,
          'contact': contact,
        }),
      );

      if (response.statusCode == 201) {
        isLoading.value = false;
        debugPrint(json.decode(response.body));
      } else {
        isLoading.value = false;
        debugPrint(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
