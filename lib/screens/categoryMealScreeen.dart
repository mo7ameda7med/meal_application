import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/mealItem.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  List<Meal> availableMeal;

  CategoryMealScreen(this.availableMeal);

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    //where => to filter the id in the  DUMMY_MEALS
    displayedMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  void removeItem(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            imageUrl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
