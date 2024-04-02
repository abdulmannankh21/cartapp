import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/meal_controller.dart';
import '../theme.dart';
import '../widget/meal_widget.dart';

class MealScreen extends StatelessWidget {
  final MealController mealController = Get.put(MealController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Meals',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.more_horiz,
                    size: 40,
                  )
                ],
              ),
            ),
            GetBuilder<MealController>(
              builder: (mealCtrlObj)
                {
                return
                  Expanded(
                    child: ListView.builder(
                      itemCount: mealController.meals.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                  color: primaryUI,
                                  borderRadius: BorderRadius.circular(17)),
                              child: MealWidget(
                                  meal: mealController.meals[index])),
                        );
                      },
                    ),
                  );
                }


            ),

          ],
        ),
      ),
    );
  }
}
