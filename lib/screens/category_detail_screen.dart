import 'package:flutter/material.dart';
import 'package:refactring_kitchen/dummy_data.dart';
import 'package:refactring_kitchen/models/card.dart';
import 'package:refactring_kitchen/models/category.dart';
import 'package:refactring_kitchen/widgets/card_item.dart';
import 'package:refactring_kitchen/widgets/category_item.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = '/category-detail-screen';
  // final List<Post> filteredPosts;
  // CategoryDetailScreen(this.filteredPosts);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final categoryId = args["id"];
    final categoryTitle = args["title"];
    List<Post> categoryDetails = [];

    for (int i = 0; i < DUMMY_MEALS.length; i++) {
      //  print(DUMMY_MEALS[i].categories.contains(categoryId));
      if (DUMMY_MEALS[i].categories.contains(categoryId)) {
        // print(filteredScreen[i].isVeg);
        categoryDetails.add(DUMMY_MEALS[i]);
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return CardItem(
                categoryDetails[index].id,
                categoryDetails[index].title,
                categoryDetails[index].image,
                categoryDetails[index].color);
          },
          itemCount: categoryDetails.length,
        ));
  }
}
