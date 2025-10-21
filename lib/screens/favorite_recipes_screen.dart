import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/models/recipe_model.dart';
import 'package:recipe_book_flutter/providers/recipes_provider.dart';
import 'package:recipe_book_flutter/screens/recipe_detail.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  const FavoriteRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Consumer<RecipesProvider>(
        builder: (context, recipesProvider, child) {
          final favoriteRecipes = recipesProvider.favoriteRecipe;

          return favoriteRecipes.isEmpty
              ? Center(child: Text('No favorite recipes yet'))
              : ListView.builder(
                  itemCount: favoriteRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = favoriteRecipes[index];
                    return favoriteRecipeCard(recipe: recipe);
                  },
                );
        },
      ),
    );
  }
}

class favoriteRecipeCard extends StatelessWidget {
  final Recipe recipe;
  const favoriteRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(recipesData: recipe),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Card(
            color: Theme.of(context).colorScheme.surfaceContainer,
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 125,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(recipe.image_link, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 26),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      recipe.name,
                      style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                    ),
                    SizedBox(height: 4),
                    Container(height: 2, width: 75, color: Colors.indigo),
                    Text(
                      'By: ${recipe.author}',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
