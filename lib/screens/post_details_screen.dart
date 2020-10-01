import 'package:flutter/material.dart';
import 'package:refactring_kitchen/dummy_data.dart';
import 'package:refactring_kitchen/models/card.dart';
import 'package:refactring_kitchen/widgets/meal_item.dart';

class PostDetailsScreen extends StatelessWidget {
  static const routeName = '/post-detail-screen';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final categoryId = args["id"];
    final categoryTitle =
        DUMMY_MEALS.firstWhere((element) => element.id == args["id"]);
    print(categoryId);
    Post itemDetails;
    for (int i = 0; i <= DUMMY_MEALS.length; i++) {
      if (DUMMY_MEALS[i].id == categoryId) {
        itemDetails = DUMMY_MEALS[i];

        break;
      }
    }
    print(itemDetails);
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.title),
        ),
        body: MealItem(
          itemDetails.id,
          itemDetails.title,
          itemDetails.image,
          itemDetails.color,
          itemDetails.ingredients,
          itemDetails.steps,
        ));
  }
}
