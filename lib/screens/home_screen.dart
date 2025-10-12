import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/screens/recipe_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[_RecipeCard(context), _RecipeCard(context)],
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

  Widget _RecipeCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RecipeDetail(recipeName: 'lasagna', authorName: 'Ricky Cortes'),
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
                      'https://www.tasteofhome.com/wp-content/uploads/2025/07/Best-Lasagna_EXPS_ATBBZ25_36333_DR_07_01_2b.jpg',
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
                      'Lasagna',
                      style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                    ),
                    SizedBox(height: 4),
                    Container(height: 2, width: 75, color: Colors.indigo),
                    Text(
                      'Ricky Cortes',
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
