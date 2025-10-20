import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/models/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipesProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Recipe> recipes = [];
  List<Recipe> favoriteRecipe = [];

  Future<void> FetchRecipes() async {
    isLoading = true;
    notifyListeners();

    /* Puertos para acceder a la data
    Android: 10.0.2.2
    IOS: 127.0.0.1
    Currently running on: localhost:3058 due to developer preferences
    */
    final url = Uri.parse('http://localhost:3058/recipes');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        recipes = List<Recipe>.from(
          data['recipes'].map((recipe) => Recipe.fromJson(recipe)),
        );
      } else {
        print('Error ${response.statusCode}');
        recipes = [];
      }
    } catch (e) {
      print('Request error');
      recipes = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavoriteStatus(Recipe recipe) async {
    final isFavorite = favoriteRecipe.contains(recipe);

    try {
      final url = Uri.parse('http://localhost:3058/favorites');
      final response = isFavorite
          ? await http.delete(url, body: json.encode({'id': recipe.id}))
          : await http.post(url, body: json.encode(recipe.toJson()));
      if (response.statusCode == 200) {
        if (isFavorite) {
          favoriteRecipe.remove(recipe);
        } else {
          favoriteRecipe.add(recipe);
        }
        notifyListeners();
      } else {
        throw Exception('Failed to update favorite status');
      }
    } catch (e) {
      print('Request error ${e}');
    } finally {
      notifyListeners();
    }
  }
}
