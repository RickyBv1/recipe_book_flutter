import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/screens/home_screen.dart';
import 'package:recipe_book_flutter/screens/favorite_recipes_screen.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/providers/recipes_provider.dart';
import 'package:recipe_book_flutter/providers/theme_provider.dart';
import 'package:recipe_book_flutter/providers/language_provider.dart';
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
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, child) {
          return MaterialApp(
            supportedLocales: [Locale('en'), Locale('es')],
            locale: languageProvider.currentLocale,
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.title,
                style: TextStyle(color: Colors.white),
              ),
              Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: languageProvider.currentLanguageCode,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                      dropdownColor: Theme.of(context).colorScheme.secondary,
                      style: TextStyle(color: Colors.white),
                      items: [
                        DropdownMenuItem<String>(
                          value: 'en',
                          child: Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(AppLocalizations.of(context)!.english),
                            ],
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'es',
                          child: Row(
                            children: [
                              Icon(
                                Icons.language_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(AppLocalizations.of(context)!.spanish),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          languageProvider.setLocale(Locale(newValue));
                        }
                      },
                    ),
                  );
                },
              ),
            ],
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
