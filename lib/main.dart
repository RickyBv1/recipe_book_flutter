import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/screens/home_screen.dart';
import 'package:recipe_book_flutter/screens/favorite_recipes_screen.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/providers/recipes_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecipesProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe Book',
        home: RecipeBook(),
      ),
    );
  }
}

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            'Recipe Book',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(icon: Icon(Icons.home_outlined), text: 'Home'),
              Tab(
                icon: Icon(Icons.favorite_outline_rounded),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [HomeScreen(), FavoriteRecipesScreen()]),
      ),
    );
  }
}
