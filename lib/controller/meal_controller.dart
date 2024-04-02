import 'package:get/get.dart';

import '../model/model.dart';

class MealController extends GetxController {

  final meals = <Meal>[
    Meal('Meal One', [
      Product("Eggs", 100),
      Product("Bacon", 150),
      Product("Toast", 80),
    ],
  'images/halfsun.png',330
    ),
  Meal('Meal Two', [
    Product("Bacon", 150),
    Product("Toast", 80),
  ],
  'images/duplicate.png' ,230 ),
  Meal('Meal Three', [

  ],
  'images/sun.png' ,0 ),
  Meal('Meal Four', [

  ],
  'images/night.png',0
  ),
  Meal('Meal Five', [

  ],
      'images/fullmoon.png',0  ),
  ];

  void deleteProduct(int mealIndex, int productIndex) {
    // meals[mealIndex].products.removeAt(productIndex);
    int removedCalories = meals[mealIndex].products[productIndex].calories;
    meals[mealIndex].products.removeAt(productIndex);

    // Subtract the calories of the removed product from the total calories of the meal
    meals[mealIndex].total = (meals[mealIndex].total! - removedCalories)!;
    update();
  }


}

// void addMeal(String name,String icon, List<Product> products) {
//   meals.add(Meal(name, products,icon));
// }
//
// void addProduct(int mealIndex, Product product) {
//   meals[mealIndex].products.add(product);
// }