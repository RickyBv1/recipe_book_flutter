import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/screens/home_screen.dart';
import 'package:recipe_book_flutter/screens/favorite_recipes_screen.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/providers/recipes_provider.dart';
import 'package:recipe_book_flutter/theme/theme.dart';

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
      child: MaterialApp(
        theme: lightMode,
        darkTheme: darkMode,
        debugShowCheckedModeBanner: false,
        title: 'Recipe Book',
        home: const RecipeBook(),
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
          backgroundColor: Theme.of(context).colorScheme.primary,
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
