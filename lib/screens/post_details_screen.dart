import 'package:flutter/material.dart';
import 'package:refactring_kitchen/dummy_data.dart';
import 'package:refactring_kitchen/models/card.dart';
import 'package:refactring_kitchen/widgets/card_item.dart';
import 'package:refactring_kitchen/widgets/meal_item.dart';

class PostDetailsScreen extends StatelessWidget {
  static const routeName = '/post-detail-screen';
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context).settings.arguments; //Capture category
    final categoryId = args["id"];
    print(categoryId);
    Post itemDetails; //This should be made as list
    for (int i = 0; i <= DUMMY_MEALS.length; i++) {
      if (DUMMY_MEALS[i].id == categoryId) {
        //Find out in array if the category.
        itemDetails = DUMMY_MEALS[i];
        // itemdetails.push(DUMMY_MEALS[i])
        break; //No break
      }
    }
    print(itemDetails);
    return Scaffold(
        appBar: AppBar(
          title: Text('meal'),
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
