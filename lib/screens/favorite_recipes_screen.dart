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
      backgroundColor: Colors.white,
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
      child: Card(
        color: Colors.white,
        child: Column(children: [Text(recipe.name), Text(recipe.author)]),
      ),
    );
  }
}
