import 'package:flutter/material.dart';
import 'package:meals/widgets/my_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const route = 'filtersScreen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(23),
            child: Text(
              "Adjust your meal selection",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile.adaptive(
                title: Text(
                  "Gluten Free",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                value: _isGlutenFree,
                activeColor: Colors.pink,
                onChanged: (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: Text(
                  "Vegan",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                value: _isVegan,
                activeColor: Colors.pink,
                onChanged: (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: Text(
                  "Vegetarian",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                value: _isVegetarian,
                activeColor: Colors.pink,
                onChanged: (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: Text(
                  "Lactose Free",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                value: _isLactoseFree,
                activeColor: Colors.pink,
                onChanged: (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
