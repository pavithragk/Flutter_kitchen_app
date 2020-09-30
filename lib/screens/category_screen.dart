import 'package:flutter/material.dart';
import 'package:refactring_kitchen/dummy_data.dart';
import 'package:refactring_kitchen/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category - screen';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.id, catData.title, catData.color),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
