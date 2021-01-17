import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/categoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("meal"),
      ),
      body: GridView(
        //padding from all corner 25
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (categoriesData) => CategoryItem(categoriesData.id,
                  categoriesData.title, categoriesData.color),
            )
            .toList(),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
