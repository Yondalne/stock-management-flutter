import 'package:flutter/material.dart';
import 'package:stock_management/widgets/components/MyPageTitle.dart';
// import 'package:stock_management/widgets/components/ResourceListElement.dart';

class ResourceList extends StatelessWidget {
  const ResourceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            PageTitle(title: "Resources", routeName: "/resource/create"),
            SizedBox(
              height: 10,
            ),
            // ListView(
            //   children: [
            //     Text(
            //       "Test",
            //       style: TextStyle(
            //         color: Colors.grey[700],
            //         fontWeight: FontWeight.w500,
            //         fontSize: 30,
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
