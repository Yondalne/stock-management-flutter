import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_management/controllers/authentication.dart';
import 'package:stock_management/widgets/components/MyButton.dart';
import 'package:stock_management/widgets/components/MyTextField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  void login(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
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
      await _authenticationController.login(
        context: context,
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
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
              // Logo
              const Icon(Icons.lock, size: 100),

              const SizedBox(height: 50),

              // Welcome message
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: emailController,
                hintText: "Enter your email",
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: "Enter your password",
                obscureText: true,
              ),

              const SizedBox(height: 50),

              // signin button
              MyButton(
                text: "Sign in",
                onTap: () => login(context),
              ),

              const SizedBox(height: 50),

              // not a member ? register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member ?"),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
