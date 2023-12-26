// resource_model.dart
import 'package:stock_management/models/category.dart';

class Resource {
  final int id;
  final String name;
  final String description;
  final List<Category> categories;

  Resource({
    required this.id,
    required this.name,
    required this.description,
    required this.categories,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    List<Category> categoryList = [];
    if (json['categories'] != null) {
      categoryList = List<Category>.from(
        json['categories'].map((category) => Category.fromJson(category)),
      );
    }

    return Resource(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      categories: categoryList,
    );
  }
}
