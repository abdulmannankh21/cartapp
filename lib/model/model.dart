class Meal {
  String name;
  final String icon;

  List<Product> products;

  Meal(this.name, this.products, this.icon);
}

class Product {
  String name;
  int calories;

  Product(this.name, this.calories);
}
