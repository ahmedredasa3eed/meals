import 'package:flutter/material.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/favourite_screen.dart';
import 'package:meals/widgets/my_drawer.dart';

class TabsScreen extends StatefulWidget {

  static const route = 'tabs-screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPage = 0;

  List<Widget> screens = [CategoryScreen(),FavouriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (currentIndex) {
          setState(() {
            _selectedPage = currentIndex;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink,
        elevation: 8.0,
        //important
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.category_outlined),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Search",
              activeIcon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
            activeIcon: Icon(Icons.bookmark_border_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Log out",
            activeIcon: Icon(Icons.exit_to_app),
          ),

        ],
      ),
      body: screens[_selectedPage],
    );
  }
}
