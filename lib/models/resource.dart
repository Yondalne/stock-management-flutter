// resource_model.dart
import 'package:stock_management/models/category.dart';
import 'package:stock_management/models/provider.dart';

class Resource {
  final int id;
  final String name;
  final String description;
  final String quantity;
  final List<Category> categories;
  final List<Provider> providers;

  Resource({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.categories,
    required this.providers,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    List<Category> categoryList = [];
    List<Provider> providerList = [];
    if (json['categories'] != null) {
      categoryList = List<Category>.from(
        json['categories'].map((category) => Category.fromJson(category)),
      );
    }
    if (json['providers'] != null) {
      providerList = List<Provider>.from(
        json['providers'].map((category) => Provider.fromJson(category)),
      );
    }

    return Resource(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      quantity: json['quantity'],
      categories: categoryList,
      providers: providerList,
    );
  }
}
