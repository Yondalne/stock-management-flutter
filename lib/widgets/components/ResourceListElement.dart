import 'package:flutter/material.dart';

class ResourceListElement extends StatelessWidget {
  const ResourceListElement({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Test", style: TextStyle(color: Colors.black),),
          ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
