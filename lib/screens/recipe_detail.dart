import 'package:flutter/material.dart';
import 'package:recipe_book_flutter/models/recipe_model.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_flutter/providers/recipes_provider.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipesData;
  const RecipeDetail({super.key, required this.recipesData});

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  bool isFavorite = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isFavorite = Provider.of<RecipesProvider>(
      context,
      listen: false,
    ).favoriteRecipe.contains(widget.recipesData);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recipesData.name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: 24,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            color: isFavorite ? Colors.red : Colors.white,
            onPressed: () async {
              await Provider.of<RecipesProvider>(
                context,
                listen: false,
              ).toggleFavoriteStatus(widget.recipesData);
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.recipesData.image_link,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Recipe Steps:',
              style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
            ),
            Text(
              widget.recipesData.recipeSteps.join('\n'),
              style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
            ),
            Text(
              'By: ${widget.recipesData.author}',
              style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
            ),
          ],
        ),
      ),
    );
  }
}
