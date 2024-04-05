import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/meal_controller.dart';
import '../model/model.dart';

class AddProductDialog extends StatefulWidget {
  final Meal meal;


  const AddProductDialog({super.key, required this.meal});

  @override
  AddProductDialogState createState() => AddProductDialogState();
}

class AddProductDialogState extends State<AddProductDialog> {
  late TextEditingController _nameController;
  late TextEditingController _caloriesController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _caloriesController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _caloriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Product"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "Product Name"),
          ),
          TextField(
            controller: _caloriesController,
            decoration: const InputDecoration(labelText: "Calories"),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            String name = _nameController.text;
            int calories = int.tryParse(_caloriesController.text) ?? 0;
            Get.find<MealController>().addProduct(
                Get.find<MealController>().meals.indexOf(widget.meal),
                Product(name, calories));
            // widget.onProductAdded(name, calories);
            Navigator.pop(context);
          },
          child: const Text("Add"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
