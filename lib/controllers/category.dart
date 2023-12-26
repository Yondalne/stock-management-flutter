import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stock_management/constants/constants.dart';
import 'package:stock_management/controllers/authentication.dart';
import 'package:stock_management/models/category.dart';

class CategoryController {
  final String baseUrl = url; // L'URL de base de votre API
  final AuthenticationController _authController = Get.find();

  Future<List<Category>> getCategories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/categories'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
              'Bearer ${_authController.authToken.value}',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      print(jsonList);
      return jsonList.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> addCategory(String label) async {
    final response = await http.post(
      Uri.parse('$baseUrl/categories'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'label': label}),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add category');
    }
  }

  Future<void> updateCategory(int id, String label) async {
    final response = await http.put(
      Uri.parse('$baseUrl/categories/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'label': label}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update category');
    }
  }

  Future<void> deleteCategory(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/categories/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete category');
    }
  }
}
