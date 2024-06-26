import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/meal_controller.dart';
import '../model/model.dart';
import '../theme.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final int mealIndex;
  final int productIndex;
  final bool isEdit;

  const ProductWidget({super.key,
    required this.product,
    required this.mealIndex,
    required this.productIndex,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                product.name,
                style: const TextStyle(color: secondaryUi, fontSize: 17),
              ),
              const Spacer(),
              Text('${product.calories} Cals',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  )),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor:
                    isEdit ? Colors.red : const Color.fromARGB(255, 110, 108, 106),
                child: isEdit
                    ? InkWell(
                        onTap: () {
                          Get.find<MealController>()
                              .deleteProduct(mealIndex, productIndex);
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 10,
                        ),
                      )
                    : Image.asset(
                        'images/right.png',
                        color: Colors.white,
                        height: 8,
                      ),
              ),

            ],
          ),
          const Divider(
            color: primaryUI,
            thickness: 2,
            endIndent: 10,
            indent: 10,
          ),
        ],
      ),
    );
  }
}
