import 'package:flutter/material.dart';
import 'package:meals/data_source/categories_data.dart';
import 'package:meals/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {

  static const String route = 'categories-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
            childAspectRatio: 3/2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          children: categoriesList.map((category){
            return CategoryItem(category.id,category.title, category.color);
          }).toList(),
        ),
      ),
    );
  }
}
