import 'package:flutter/material.dart';
import '../widgets/mealItem.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  FavoritesScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeal[index].id,
            imageUrl: favoriteMeal[index].imageUrl,
            title: favoriteMeal[index].title,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
