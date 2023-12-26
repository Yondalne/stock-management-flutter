import 'package:flutter/material.dart';
import 'package:stock_management/models/resource.dart';

import '../../../models/category.dart';
import '../../../models/provider.dart';

class SingleResource extends StatelessWidget {
  final Resource resource;

  const SingleResource({Key? key, required this.resource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Resource Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${resource.name}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Description: ${resource.description}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Quantity: ${resource.quantity}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Categories:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Wrap(
              children: [
                for (final Category category in resource.categories)
                  Chip(
                    label: Text(category.label),
                  ),
                  SizedBox(width: 10),
              ],
            ),
            
            const SizedBox(height: 100),
            Text(
              "Providers:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Wrap(
              children: [
                for (final Provider provider in resource.providers)
                  Chip(
                    label: Text(provider.name +" | "+ provider.email),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
