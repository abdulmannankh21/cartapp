import 'package:get/get.dart';

import '../model/model.dart';

class MealController extends GetxController {

  final meals = <Meal>[
    Meal('Meal One', [
      Product("Eggs", 100),
      Product("Bacon", 150),
      Product("Toast", 80),
    ],
  'images/halfsun.png'
    ),
  Meal('Meal Two', [
    Product("Bacon", 150),
    Product("Toast", 80),
  ],
  'images/duplicate.png'  ),
  Meal('Meal Three', [

  ],
  'images/sun.png'  ),
  Meal('Meal Four', [

  ],
  'images/night.png'
  ),
  Meal('Meal Five', [

  ],
      'images/fullmoon.png'  ),
  ];

  void deleteProduct(int mealIndex, int productIndex) {
    meals[mealIndex].products.removeAt(productIndex);
    update();
  }

  // void addMeal(String name,String icon, List<Product> products) {
  //   meals.add(Meal(name, products,icon));
  // }
  //
  // void addProduct(int mealIndex, Product product) {
  //   meals[mealIndex].products.add(product);
  // }
}