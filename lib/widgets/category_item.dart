import 'package:flutter/material.dart';
import 'package:meals/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id,this.title, this.color);

  void navigateToMealsPage(BuildContext context){

    //Push with sending args to second page through constructor.
    //Navigator.push(context, MaterialPageRoute(builder: (context)=> MealsScreen(categoryTitle: title,categoryColor: color,categoryId: id,) ));

    //Push named with sending args to second page.
    Navigator.pushNamed(context, MealsScreen.route, arguments: {'id': id , 'title' : title, 'color' : color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> navigateToMealsPage(context),
      splashColor: color.withOpacity(0.9),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.6),
                color,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "Raleway",
          ),
        )),
      ),
    );
  }
}
