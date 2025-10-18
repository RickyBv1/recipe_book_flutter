import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/screens/recipe_detail.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<dynamic>> FetchRecipes() async {
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
        return data['recipes'];
      } else {
        print('Error ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Request error');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: FetchRecipes(),
        builder: (context, snapshot) {
          final recipes = snapshot.data ?? [];
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No recipes found'));
          } else {
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return _RecipeCard(context, recipes[index]);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
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

  Widget _RecipeCard(BuildContext context, dynamic recipe) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(
              recipeName: recipe['name'],
              authorName: recipe['author'],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Card(
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 125,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      recipe['image_link'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 26),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      recipe['name'],
                      style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                    ),
                    SizedBox(height: 4),
                    Container(height: 2, width: 75, color: Colors.indigo),
                    Text(
                      recipe['author'],
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
              style: TextStyle(color: Colors.indigo, fontSize: 24),
            ),
            SizedBox(height: 16),
            _buildTextField(
              label: 'Recipe Name',
              prefixIcon: Icon(Icons.restaurant, color: Colors.indigo),
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
              label: 'Author Name',
              prefixIcon: Icon(Icons.person, color: Colors.indigo),
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
              label: 'Image URL',
              prefixIcon: Icon(Icons.image, color: Colors.indigo),
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
              label: 'Recipe Instructions',
              prefixIcon: Icon(Icons.description, color: Colors.indigo),
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
                  backgroundColor: Colors.indigo,
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
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.indigo, fontFamily: 'Roboto'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      maxLines: maxLines,
    );
  }
}
