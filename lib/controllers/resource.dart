// resource_controller.dart
import 'dart:convert';

import 'package:get/get.dart';
import 'package:stock_management/constants/constants.dart';
import 'package:stock_management/controllers/authentication.dart';
import 'package:stock_management/models/resource.dart';
import 'package:http/http.dart' as http;

class ResourceController extends GetxController {
  final RxList<Resource> resources = <Resource>[].obs;
  final AuthenticationController _authController = Get.find();
  final RxList<Resource> resourcesList = <Resource>[].obs;

  Future<void> fetchResources() async {
    try {
      final response = await http.get(
        Uri.parse(url + '/resources'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${_authController.authToken.value}', // Ajout du token Bearer ici
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Resource> fetchedResources =
            data.map((resource) => Resource.fromJson(resource)).toList();
        resources.value = fetchedResources;
      } else {
        print('Failed to load resources: ${response.body}');
      }
    } catch (error) {
      print('An error occurred: $error');
    }
  }

  Future<void> deleteResource(int resourceId) async {
    try {
      var response = await http.delete(
        Uri.parse('$url/resources/$resourceId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_authController.authToken.value}',
        },
      );

      if (response.statusCode == 204) {
        print('Resource deleted successfully');
        resourcesList.removeWhere((resource) => resource.id == resourceId);
        
      } else if (response.statusCode == 401) {
        print('Unauthorized: ${response.body}');
      } else {
        print(
            'Error deleting resource. Status code: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      print('An unexpected error occurred: $e');
    }
  }
}
