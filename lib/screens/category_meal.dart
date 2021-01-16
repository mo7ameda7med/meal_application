import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';

class CategoryMeal extends StatefulWidget {
  static const routeName = 'category_Meals';

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    //where => to filter the id in the  DUMMY_MEALS
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return Text(categoryMeals[index].title);
      },
        itemCount:categoryMeals.length,),
    );
  }
}
