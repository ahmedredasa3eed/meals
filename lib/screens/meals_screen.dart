import 'package:flutter/material.dart';
import 'package:meals/data_source/meals_data.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  static const String route = 'meals-screen';

  /*final String categoryTitle;
  final String categoryId;
  final Color categoryColor;
  MealsScreen({this.categoryTitle, this.categoryId, this.categoryColor});*/

  @override
  Widget build(BuildContext context) {
    //here how to receive new args through ModalRoute
    final routeArgs =
    ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, dynamic>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryColor = routeArgs['color'];

    final mealsByCategory = mealsList.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: mealsByCategory.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: mealsByCategory[index].id,
              title: mealsByCategory[index].title,
              imageUrl: mealsByCategory[index].imageUrl,
              duration: mealsByCategory[index].duration,
              complexity: mealsByCategory[index].complexity,
              affordability: mealsByCategory[index].affordability,
              categoryColor: categoryColor,);
          }),
    );
  }

}
