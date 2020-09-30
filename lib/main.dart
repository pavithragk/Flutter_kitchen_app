import 'package:flutter/material.dart';
import 'package:refactring_kitchen/dummy_data.dart';
import 'package:refactring_kitchen/models/card.dart';
import 'package:refactring_kitchen/screens/bottom_navigation_screen.dart';
import 'package:refactring_kitchen/screens/category_detail_screen.dart';
import 'package:refactring_kitchen/screens/category_screen.dart';
import 'package:refactring_kitchen/screens/filters_screen.dart';
import 'package:refactring_kitchen/screens/home_screen.dart';
import 'package:refactring_kitchen/screens/post_details_screen.dart';
import 'package:refactring_kitchen/widgets/meal_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'vegetarian': false,
    'nonvegetarian': false,
  };
  List<Post> _filteredPosts = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
    });
    for (int i = 0; i < DUMMY_MEALS.length; i++) {
      if (DUMMY_MEALS[i].isVeg == _filters["vegetarian"]) {
        // print("---");
        // print(_filters["vegetarian"]);
        // print(DUMMY_MEALS[i].isVeg);

        _filteredPosts.add(DUMMY_MEALS[i]);
      }
      if (DUMMY_MEALS[i].isNonVeg == _filters["nonvegetarian"]) {
        _filteredPosts.add(DUMMY_MEALS[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(_filteredPosts);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.black87,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              // fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: BottomNavigationScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => BottomNavigationScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
        CategoryDetailScreen.routeName: (ctx) => CategoryDetailScreen(),
        CategoryScreen.routeName: (ctx) => CategoryScreen(),
        PostDetailsScreen.routeName: (ctx) => PostDetailsScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen()
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        );
      },
    );
  }
}
