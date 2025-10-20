import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/models/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipesProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Recipe> recipes = [];

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
}
