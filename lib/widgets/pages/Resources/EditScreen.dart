import 'package:flutter/material.dart';
import 'package:stock_management/controllers/category.dart';
import 'package:stock_management/controllers/resource.dart';
import 'package:stock_management/models/category.dart';
import 'package:stock_management/models/resource.dart';
import 'package:stock_management/widgets/components/MyButton.dart';
import 'package:stock_management/widgets/components/MyTextField.dart';

class EditResource extends StatefulWidget {
  EditResource({super.key, required this.resource});
  final Resource resource;

  @override
  _EditResourceState createState() => _EditResourceState();
}

class _EditResourceState extends State<EditResource> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final qtyController = TextEditingController();
  List<Category> categories = [];
  List<int> selectedCategories = [];

  final CategoryController _categoryController = CategoryController();
  final ResourceController _resourceController = ResourceController();

  @override
  void initState() {
    super.initState();
    loadCategories();

    // Initialiser les champs de texte avec les valeurs de la ressource
    nameController.text = widget.resource.name;
    descController.text = widget.resource.description;
    qtyController.text = widget.resource.quantity.toString();

    // Initialiser les catégories sélectionnées
    selectedCategories =
        widget.resource.categories.map((category) => category.id).toList();
  }

  Future<void> loadCategories() async {
    try {
      final loadedCategories = await _categoryController.getCategories();
      setState(() {
        categories = loadedCategories;
      });
    } catch (e) {
      // Gérez l'erreur selon vos besoins
      print('Error loading categories: $e');
    }
  }

  void save() async {
    // Ajoutez votre logique de sauvegarde ici avec les données saisies
    print('Name: ${nameController.text}');
    print('Description: ${descController.text}');
    print('Quantity: ${qtyController.text}');
    print('Selected Categories: $selectedCategories');

    final String? result = await _resourceController.updateResource(
      resourceId: widget.resource.id,
      name: nameController.text,
      description: descController.text,
      quantity: int.parse(qtyController.text),
      categories: selectedCategories,
    );

    if (result == null) {
      Navigator.pushNamed(context, '/resource');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(result),
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
              Text(
                "Edit Resource",
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
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                height: 200, // Ajustez la hauteur en fonction de vos besoins
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final Category category = categories[index];
                    return CheckboxListTile(
                      title: Text(category.label),
                      value: selectedCategories.contains(category.id),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value!) {
                            selectedCategories.add(category.id);
                          } else {
                            selectedCategories.remove(category.id);
                          }
                        });
                      },
                    );
                  },
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
