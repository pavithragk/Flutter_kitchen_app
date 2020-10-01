import 'package:flutter/material.dart';
import 'package:refactring_kitchen/dummy_data.dart';
import 'package:refactring_kitchen/models/card.dart';
import 'package:refactring_kitchen/widgets/card_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home - screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildSwitch(String title, bool value, Function onChanged) {
    return Row(
      children: [
        Text(title),
        Switch(
          onChanged: onChanged,
          value: value,
          activeColor: Theme.of(context).primaryColor,
          activeTrackColor: Theme.of(context).accentColor,
        ),
      ],
    );
  }

  bool veg = false;
  bool nonVeg = false;

  List<Post> allItemsList = DUMMY_MEALS;

  @override
  Widget build(BuildContext context) {
    List<Post> _filteredList = allItemsList;
    _filteredList = allItemsList.where((element) {
      return element.isVeg == veg && element.isNonVeg == nonVeg ||
          element.isVeg == !veg && element.isNonVeg == nonVeg;
    }).toList();

    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              _buildSwitch("Veg", veg, (newValue) {
                setState(() {
                  veg = newValue;
                  nonVeg = !newValue;
                });
              }),
              _buildSwitch("NonVeg", nonVeg, (newValue) {
                setState(() {
                  nonVeg = newValue;
                  veg = !newValue;
                });
              })
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount:
                (!veg && !nonVeg) ? allItemsList.length : _filteredList.length,
            itemBuilder: (!veg && !nonVeg)
                ? (context, index) => CardItem(
                    allItemsList[index].id,
                    allItemsList[index].title,
                    allItemsList[index].image,
                    allItemsList[index].color)
                : (context, index) => CardItem(
                    _filteredList[index].id,
                    _filteredList[index].title,
                    _filteredList[index].image,
                    _filteredList[index].color),
          ),
        ),
      ],
    ));
  }
}
