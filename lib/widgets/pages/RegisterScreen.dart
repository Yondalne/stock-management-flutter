import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_management/controllers/authentication.dart';
import 'package:stock_management/widgets/components/MyButton.dart';
import 'package:stock_management/widgets/components/MyTextField.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  // text controller
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final contactController = TextEditingController();

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  void register(BuildContext context) async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty ||
        contactController.text.isEmpty) {
      // Afficher un modal pour signaler que les champs sont vides
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Empty fields"),
            content: Text("Please fill them all"),
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
      await _authenticationController.register(
          context: context,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          contact: contactController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome message
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: nameController,
                  hintText: "Name",
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // contact textfield
                MyTextField(
                  controller: contactController,
                  hintText: "Contact",
                  obscureText: false,
                ),

                const SizedBox(height: 50),

                // signin button
                Obx(() {
                  return _authenticationController.isLoading.value
                      ? CircularProgressIndicator()
                      : MyButton(
                          text: "Register",
                          onTap: () => register(context),
                        );
                }),

                const SizedBox(height: 50),

                // login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already has an account?"),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
