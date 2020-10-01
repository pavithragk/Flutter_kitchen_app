import 'package:flutter/material.dart';
import 'package:refactring_kitchen/dummy_data.dart';
import 'package:refactring_kitchen/models/card.dart';
import 'package:refactring_kitchen/widgets/card_item.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = '/category-detail-screen';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final categoryId = args["id"];
    final categoryTitle = args["title"];
    List<Post> categoryDetails = [];

    for (int i = 0; i < DUMMY_MEALS.length; i++) {
      if (DUMMY_MEALS[i].categories.contains(categoryId)) {
        categoryDetails.add(DUMMY_MEALS[i]);
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemCount: categoryDetails.length,
          itemBuilder: (context, index) {
            return CardItem(
                categoryDetails[index].id,
                categoryDetails[index].title,
                categoryDetails[index].image,
                categoryDetails[index].color);
          },
        ));
  }
}
