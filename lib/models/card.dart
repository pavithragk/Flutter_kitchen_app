import 'package:flutter/material.dart';

class Post {
  final String id;
  final String title;
  final String image;
  final Color color;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> categories;
  final bool isVeg;
  final bool isNonVeg;

  Post(
      {@required this.id,
      @required this.title,
      this.image,
      this.color = Colors.orange,
      this.categories,
      this.ingredients,
      this.steps,
      this.isVeg,
      this.isNonVeg});
}
