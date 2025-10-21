import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/models/recipe_model.dart';
import 'package:recipe_book_flutter/screens/recipe_detail.dart';
import 'package:recipe_book_flutter/providers/recipes_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipesProvider = Provider.of<RecipesProvider>(
      context,
      listen: false,
    );
    recipesProvider.FetchRecipes();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Consumer<RecipesProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.recipes.isEmpty) {
            return const Center(child: Text('No recipes found'));
          } else {
            return ListView.builder(
              itemCount: provider.recipes.length,
              itemBuilder: (context, index) {
                return _RecipeCard(context, provider.recipes[index]);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _showButton(context);
        },
      ),
    );
  }

  Future<void> _showButton(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 600,
          child: const RecipeForm(),
        ),
      ),
    );
  }

  Widget _RecipeCard(BuildContext context, Recipe recipe) {
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
                    Container(
                      height: 2,
                      width: 75,
                      color: Theme.of(context).colorScheme.primary,
                    ),
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

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController recipeName = TextEditingController();
    final TextEditingController authorName = TextEditingController();
    final TextEditingController imageUrl = TextEditingController();
    final TextEditingController recipeInstructions = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add a new recipe',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            _buildTextField(
              context: context,
              label: 'Recipe Name',
              prefixIcon: Icon(
                Icons.restaurant,
                color: Theme.of(context).colorScheme.primary,
              ),
              controller: recipeName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Recipe name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              context: context,
              label: 'Author Name',
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.primary,
              ),
              controller: authorName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Author name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              context: context,
              label: 'Image URL',
              prefixIcon: Icon(
                Icons.image,
                color: Theme.of(context).colorScheme.primary,
              ),
              controller: imageUrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Image URL is required';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              context: context,
              label: 'Recipe Instructions',
              prefixIcon: Icon(
                Icons.description,
                color: Theme.of(context).colorScheme.primary,
              ),
              controller: recipeInstructions,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Recipe instructions are required';
                }
                return null;
              },
              maxLines: 5,
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Save Recipe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required Icon prefixIcon,
    required TextEditingController controller,
    required String? Function(String?) validator,
    int maxLines = 1,
    required BuildContext context,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontFamily: 'Roboto',
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      maxLines: maxLines,
    );
  }
}
