import 'package:flutter/material.dart';
import 'package:refactring_kitchen/dummy_data.dart';
import 'package:refactring_kitchen/models/post.dart';
import 'package:refactring_kitchen/widgets/card_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<Post> autoList = DUMMY_MEALS;
  List<Post> filteredList = [];

  @override
  void initState() {
    filteredList.addAll(autoList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    onSearchChangedValue(String text) {
      setState(() {
        filteredList = autoList.where((element) {
          return element.title.toLowerCase().contains(text.toLowerCase());
        }).toList();
      });
      print(filteredList);
    }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              onChanged: onSearchChangedValue,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) => CardItem(
                  filteredList[index].id,
                  filteredList[index].title,
                  filteredList[index].image,
                  filteredList[index].color),
            ),
          )
        ],
      ),
    );
  }
}
