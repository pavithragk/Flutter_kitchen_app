import 'package:flutter/material.dart';
import 'package:refactring_kitchen/screens/bottom_navigation_screen.dart';
import 'package:refactring_kitchen/screens/category_detail_screen.dart';
import 'package:refactring_kitchen/screens/category_screen.dart';
import 'package:refactring_kitchen/screens/home_screen.dart';
import 'package:refactring_kitchen/screens/post_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.black87,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),

      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => BottomNavigationScreen(),
        CategoryDetailScreen.routeName: (ctx) => CategoryDetailScreen(),
        CategoryScreen.routeName: (ctx) => CategoryScreen(),
        PostDetailsScreen.routeName: (ctx) => PostDetailsScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        );
      },
    );
  }
}
