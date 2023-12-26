import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_management/controllers/authentication.dart';
import 'package:stock_management/widgets/components/MyCard.dart';

class HomeScreen extends StatelessWidget {
  final AuthenticationController _authenticationController = Get.find();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 100),

            Text(
              "Menu",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),

            const SizedBox(height: 25),

            // Card Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyCard(
                  text: " Ressources ",
                  icon: Icons.storage,
                  onTap: () {
                    Navigator.pushNamed(context, "/resource");
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                MyCard(
                  text: " Operations ",
                  icon: Icons.history,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyCard(
                  text: "Fournisseurs",
                  icon: Icons.store,
                  onTap: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                MyCard(
                  text: " Categories ",
                  icon: Icons.bento_sharp,
                  onTap: () {},
                ),
              ],
            ),

            SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyCard(
                  text: "   LogOut   ",
                  icon: Icons.sensor_door_outlined,
                  onTap: () => _authenticationController.logout(context),
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Token: ${_authenticationController.authToken}'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
