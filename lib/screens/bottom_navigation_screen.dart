import 'package:flutter/material.dart';
import 'package:refactring_kitchen/models/card.dart';
import 'package:refactring_kitchen/screens/category_screen.dart';
import 'package:refactring_kitchen/screens/home_screen.dart';
import 'package:refactring_kitchen/screens/search_screen.dart';
import 'package:refactring_kitchen/widgets/main_drawer.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationScreenState();
  }
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  List<Map<String, Object>> _screens = [
    {
      'page': HomeScreen(),
      'title': 'Home',
    },
    {'page': SearchScreen(), 'title': 'Search'},
    {
      'page': CategoryScreen(),
      'title': 'Select your category',
    },
  ];

  // @override
  // void initState() {
  //   _screens = [

  //     // ProfileScreen(),
  //   ];
  // }

  int _selectedIndex = 0;
  // static List<Post> get filteredPosts => [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          _screens[_selectedIndex]['title'],
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black87),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.search, color: Colors.black87),
              ),
              title: Text('search')),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.category, color: Colors.black87),
              ),
              title: Text('category')),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      // onPressed: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => AddPost()),
      //   );
      // },
      // child: Icon(Icons.add, color: Colors.black),
      // backgroundColor: Theme.of(context).primaryColor),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _screens[_selectedIndex]['page'],
    );
  }
}
