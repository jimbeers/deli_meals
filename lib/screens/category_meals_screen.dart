import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories-meals';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    // get the list of meals that include the categoryId in the list of associated IDs
    final displMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: displMeals[index].id,
            affordability: displMeals[index].affordability,
            complexity: displMeals[index].complexity,
            duration: displMeals[index].duration,
            imageUrl: displMeals[index].imageUrl,
            title: displMeals[index].title,
          );
        }),
        itemCount: displMeals.length,
      ),
    );
  }
}
