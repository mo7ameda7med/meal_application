import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filtersScreen.dart';
import './screens/tabsScreen.dart';
import './screens/categoryMealScreeen.dart';
import './screens/mealDetialsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favoriteMeal = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      availableMeal = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        if (filters['vegan'] && !meal.isVegan) return false;
        if (filters['vegetarian'] && !meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }

  void toggleFavorites(String mealId) {
    final existingMeal = favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingMeal >= 0) {
      setState(() {
        favoriteMeal.removeAt(existingMeal);
      });
    } else {
      favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool isMealFavorite(String id) {
    return favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: Categories(),
      routes: {
        '/': (context) => TabsScreen(favoriteMeal),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(availableMeal),
        MealDetailsScreen.routeName: (context) =>
            MealDetailsScreen(toggleFavorites, isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(setFilters, filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}
