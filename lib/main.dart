import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber
      ),

      home: TabsScreen(),
      routes: {
        TabsScreen.route : (context)=> TabsScreen(),
        MealsScreen.route : (context) => MealsScreen(),
        MealDetailsScreen.route : (context) => MealDetailsScreen(),
        FiltersScreen.route : (context) => FiltersScreen(),
      },
      //to redirect user to a page in happened error in navigation such 404 page in web
      onUnknownRoute: (setting){
        return MaterialPageRoute(builder: (context) => CategoryScreen());
      },
    );
  }
}

