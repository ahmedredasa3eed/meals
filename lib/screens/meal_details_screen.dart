import 'package:flutter/material.dart';
import 'package:meals/data_source/meals_data.dart';

class MealDetailsScreen extends StatelessWidget {

  static const route = 'meal-details';


  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,dynamic>;
    final mealId = routeArgs['id'];
    final Color categoryColor = routeArgs['categoryColor'];

    final selectedMeal = mealsList.firstWhere((meal) {
      return meal.id == mealId ;
    });

    print(selectedMeal.id);
    return Scaffold(
      appBar: AppBar(
          title : Text("Details- $mealId"),
        centerTitle: true,
        backgroundColor: categoryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Hero(
                    tag : 'image',
                    child: Image.network(selectedMeal.imageUrl , fit: BoxFit.cover,)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8,),
                child: Text("Ingredient", style: TextStyle(fontSize:30,fontWeight:FontWeight.bold,),),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                padding: EdgeInsets.symmetric(horizontal: 30,),
                child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context,index){
                    return Card(
                      color: categoryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedMeal.ingredients[index],style: TextStyle(color: Colors.white),),
                      ),
                    );
                  },

                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 8,),
                child: Text("Steps", style: TextStyle(fontSize:30,fontWeight:FontWeight.bold,),),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Card(
                          color: categoryColor,
                          child: ListTile(
                            title: Text(selectedMeal.steps[index],style: TextStyle(color: Colors.white),),
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: Text((index + 1).toString()),
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
