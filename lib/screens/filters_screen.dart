import 'package:flutter/material.dart';
import 'package:refactring_kitchen/dummy_data.dart';
import 'package:refactring_kitchen/models/card.dart';
import 'package:refactring_kitchen/screens/home_screen.dart';
import 'package:refactring_kitchen/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  // final Map<String, bool> filters;
  // Function setFilters;
  // FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // Map<String, bool> _filters = {'vegetarian': false, 'nonvegetarian': false};
  bool _vegetarian = false;
  bool _nonVegetarian = false;

  @override
  // initState() {
  //   _vegetarian = widget.filters['vegetarian'];
  //   _nonVegetarian = widget.filters['nonvegetarian'];

  //   super.initState();
  // }

  List<Post> filteredPosts = [];

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updatedValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updatedValue);
  }

  // void selectCategory(BuildContext ctx) {
  //   Navigator.of(ctx).pushNamed(
  //     HomeScreen.routeName,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        // actions: <Widget>[
        //   IconButton(
        //       icon: Icon(Icons.save),
        //       onPressed: () {
        //         final selectedFilters = {
        //           'vegetarian': _vegetarian,
        //           'nonvegetarian': _nonVegetarian
        //         };
        //         print(selectedFilters);
        //         widget.setFilters(selectedFilters);
        //       })
        // ],
        title: Text('Your Filters'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Adjust your likes",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          buildSwitchListTile('Vegeterian', 'Includes only veg', _vegetarian,
              (newValue) {
            setState(() {
              _vegetarian = newValue;
            });
            print(_vegetarian);
          }),
          buildSwitchListTile(
              'Non-Vegeterian', 'Includes only Non - veg', _nonVegetarian,
              (newValue) {
            setState(() {
              _nonVegetarian = newValue;
            });
            print(_nonVegetarian);
          }),
        ],
      ),
    );
  }
}
