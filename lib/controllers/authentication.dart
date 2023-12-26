import 'dart:convert';

import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:http/http.dart' as http;
import 'package:stock_management/constants/constants.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final RxString authToken = RxString('');

  Future<void> register({
    required BuildContext context,
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
        body: jsonEncode(data),
      );

      isLoading.value = false;

      if (response.statusCode == 201) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        authToken.value = jsonResponse['token'];

        Navigator.pushNamed(context, "/home");
      } else if (response.statusCode == 400) {
        // Afficher le code 400 dans un modal
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Registration Error"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("An error occurred with status code 400."),
                  const SizedBox(height: 10),
                  Text("Error Code: ${response.body}"),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        // Afficher le code d'erreur dans un modal
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Registration Error"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "An error occurred with status code ${response.statusCode}."),
                  const SizedBox(height: 10),
                  Text("Errors: ${response.body}"),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      isLoading.value = false;
      // Afficher l'erreur dans un modal
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Registration Error"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("An unexpected error occurred: $e"),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      var data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse(url + '/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        authToken.value = jsonResponse['token'];

        Navigator.pushNamed(context, "/home");
      } else if (response.statusCode == 400) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Error"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("An error occurred with status code 400."),
                  const SizedBox(height: 10),
                  Text("Error Code: ${response.body}"),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        // Afficher le code d'erreur dans un modal
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Error"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "An error occurred with status code ${response.statusCode}."),
                  const SizedBox(height: 10),
                  Text("Errors: ${response.body}"),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      isLoading.value = false;
      // Afficher l'erreur dans un modal
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Error"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("An unexpected error occurred: $e"),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
