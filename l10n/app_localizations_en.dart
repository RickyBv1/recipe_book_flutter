// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Recipe Book';

  @override
  String get navBarHome => 'Home';

  @override
  String get navBarFavorites => 'Favorites';

  @override
  String get by => 'By: ';

  @override
  String get recipeSteps => 'Recipe Steps:';

  @override
  String get addRecipe => 'Add a new recipe';

  @override
  String get recipeName => 'Recipe Name';

  @override
  String get authorName => 'Author Name';

  @override
  String get imageUrl => 'Image URL';

  @override
  String get recipeInstructions => 'Recipe Instructions';

  @override
  String get saveRecipeButton => 'Save Recipe';

  @override
  String get recipeNameRequired => 'Recipe name is required';

  @override
  String get authorNameRequired => 'Author name is required';

  @override
  String get imageUrlRequired => 'Image URL is required';

  @override
  String get recipeInstructionsRequired => 'Recipe instructions are required';

  @override
  String get emptyFavorites => 'No favorite recipes yet';
}
