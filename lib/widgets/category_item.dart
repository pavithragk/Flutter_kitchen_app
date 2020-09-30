import 'package:flutter/material.dart';
import 'package:refactring_kitchen/screens/category_detail_screen.dart';
import 'package:refactring_kitchen/screens/post_details_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  // final List<String> categories;

  CategoryItem(
    this.id,
    this.title,
    this.color,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryDetailScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}