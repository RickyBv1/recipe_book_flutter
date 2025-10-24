// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get title => 'Libro de Recetas';

  @override
  String get navBarHome => 'Inicio';

  @override
  String get navBarFavorites => 'Favoritos';

  @override
  String get by => 'Por: ';

  @override
  String get recipeSteps => 'Pasos de la receta:';

  @override
  String get addRecipe => 'Agregar una nueva receta';

  @override
  String get recipeName => 'Nombre de la receta';

  @override
  String get authorName => 'Nombre del autor';

  @override
  String get imageUrl => 'URL de la imagen';

  @override
  String get recipeInstructions => 'Instrucciones de la receta';

  @override
  String get saveRecipeButton => 'Guardar receta';

  @override
  String get recipeNameRequired => 'El nombre de la receta es requerido';

  @override
  String get authorNameRequired => 'El nombre del autor es requerido';

  @override
  String get imageUrlRequired => 'La URL de la imagen es requerida';

  @override
  String get recipeInstructionsRequired =>
      'Las instrucciones de la receta son requeridas';

  @override
  String get emptyFavorites => 'No hay recetas favoritas todavía';
}
