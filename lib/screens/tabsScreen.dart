import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/mainDrawer.dart';
import '../screens/categoriesScreen.dart';
import '../screens/favoritesScreen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  TabsScreen(this.favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> page;

  int selectPageIndex = 0;

  @override
  void initState() {
    page = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {
        'page': FavoritesScreen(widget.favoriteMeal),
        'title': "Your Favorites "
      },
    ];
    super.initState();
  }

  void selectPage(int value) {
    setState(() {
      selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page[selectPageIndex]['title']),
      ),
      body: page[selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("favorites")),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
