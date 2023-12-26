import 'package:flutter/material.dart';
import 'package:stock_management/widgets/components/MyButton.dart';
import 'package:stock_management/widgets/components/MyTextField.dart';

class CreateResource extends StatelessWidget {
  CreateResource({super.key});

  // text controller
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final qtyController = TextEditingController();

  void save() {}
  void increment() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add Resource",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 25),

              MyTextField(
                controller: nameController,
                hintText: "Name",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  maxLines: 5,
                  controller: descController,
                  style: TextStyle(fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Description",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: qtyController,
                  style: TextStyle(fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Quantity",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              MyButton(
                text: "Save",
                onTap: save,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
