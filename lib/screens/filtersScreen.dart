import 'package:flutter/material.dart';
import '../widgets/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  State<StatefulWidget> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  void initState() {
    //save marker switch
    isGlutenFree = widget.currentFilters['gluten'];
    isLactoseFree = widget.currentFilters['lactose'];
    isVegan = widget.currentFilters['vegan'];
    isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget switchTile(
      String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegan': isVegan,
                'vegetarian': isVegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          switchTile(
            "Gluten-free",
            "Only includes gluten-free meals",
            isGlutenFree,
            (newValue) {
              setState(() {
                isGlutenFree = newValue;
              });
            },
          ),
          switchTile(
            "Lactose-Free",
            "Only includes Lactose-Free meals",
            isLactoseFree,
            (newValue) {
              setState(() {
                isLactoseFree = newValue;
              });
            },
          ),
          switchTile(
            "Vegan",
            "Only includes Vegan meals",
            isVegan,
            (newValue) {
              setState(() {
                isVegan = newValue;
              });
            },
          ),
          switchTile(
            "Vegetarian",
            "Only includes Vegetarian meals",
            isVegetarian,
            (newValue) {
              setState(() {
                isVegetarian = newValue;
              });
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
