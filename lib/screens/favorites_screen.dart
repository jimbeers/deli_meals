import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favs;
  const FavoritesScreen(this.favs);

  @override
  Widget build(BuildContext context) {
    if (favs.isEmpty) {
      return Center(
        child: Text("The Favorites, you have none, start adding some."),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: favs[index].id,
            affordability: favs[index].affordability,
            complexity: favs[index].complexity,
            duration: favs[index].duration,
            imageUrl: favs[index].imageUrl,
            title: favs[index].title,
          );
        }),
        itemCount: favs.length,
      );
    }
  }
}
