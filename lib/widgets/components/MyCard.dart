import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key, required this.text, required this.icon, required this.onTap});

  final String text;
  final IconData icon;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60.0,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
