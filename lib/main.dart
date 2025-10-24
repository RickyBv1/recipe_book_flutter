import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/screens/home_screen.dart';
import 'package:recipe_book_flutter/screens/favorite_recipes_screen.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/providers/recipes_provider.dart';
import 'package:recipe_book_flutter/providers/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:recipe_book_flutter/l10n/app_localizations.dart';

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
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            supportedLocales: [Locale('en'), Locale('es')],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: themeProvider.themeData,
            debugShowCheckedModeBanner: false,
            title: 'Recipe Book',
            home: const RecipeBook(),
          );
        },
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
          title: Text(
            AppLocalizations.of(context)!.title,
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(
                icon: Icon(Icons.home_outlined),
                text: AppLocalizations.of(context)!.navBarHome,
              ),
              Tab(
                icon: Icon(Icons.favorite_outline_rounded),
                text: AppLocalizations.of(context)!.navBarFavorites,
              ),
            ],
          ),
        ),
        body: TabBarView(children: [HomeScreen(), FavoriteRecipesScreen()]),
      ),
    );
  }
}
