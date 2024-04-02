class Meal {
  String name;
   String icon;
   int? total;

  List<Product> products;

  Meal(this.name, this.products, this.icon,this.total);
}

class Product {
  String name;
  int calories;

  Product(this.name, this.calories);
}
