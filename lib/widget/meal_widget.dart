import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/meal_controller.dart';
import '../model/model.dart';
import '../theme.dart';
import '../widget/product_widget.dart';

class MealWidget extends StatefulWidget {
  final Meal meal;

  MealWidget({required this.meal});

  @override
  State<MealWidget> createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: Border.all(color: Colors.transparent),
      leading: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(23)),
        child: Center(
          child: Image.asset(
            widget.meal.icon,
            height: 25,
          ),
        ),
      ),
      title: Text(
        widget.meal.name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: widget.meal.products.length.isEqual(0)
          ? Container(
              height: 20,
              width: 50,
              decoration: BoxDecoration(
                  color: secondaryUi, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                'No products',
                style: TextStyle(color: Colors.white),
              )),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isEdit = !isEdit;
                    });
                  },
                  child: Container(
                    height: 24,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: isEdit ? Colors.green : secondaryUi),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        isEdit ? 'Save' : 'Edit',
                        style:
                            TextStyle(color: isEdit ? Colors.green : secondary),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'images/save.png',
                  scale: 22,
                  color: secondaryUi,
                )
              ],
            ),

      trailing: Transform.translate(
        offset: const Offset(28, -8),
        child: Container(
          height: 70,
          width: 50,
          decoration: BoxDecoration(
              color: secondary,
              border: Border.all(color: primary, width: 2),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(23),
                  bottomLeft: Radius.circular(10))),
          child: Center(
              child: Image.asset(
            'images/plus.png',
            color: Colors.white,
            height: 25,
          )),
        ),
      ),
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(17)),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ...widget.meal.products.asMap().entries.map((entry) {
                    int index = entry.key;
                    Product product = entry.value;
                    return ProductWidget(
                      product: product,
                      mealIndex:
                          Get.find<MealController>().meals.indexOf(widget.meal),
                      productIndex: index,
                      isEdit: isEdit,
                    );
                  }).toList(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ),
                        Text(
                          "${widget.meal.total} Cals",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ],
    );
  }
}
