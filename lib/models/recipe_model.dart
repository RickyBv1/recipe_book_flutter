class Recipe {
  String name;
  String author;
  String image_link;
  List<String> recipeSteps;

  Recipe({
    required this.name,
    required this.author,
    required this.image_link,
    required this.recipeSteps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      author: json['author'],
      image_link: json['image_link'],
      recipeSteps: List<String>.from(json['recipe']),
    );
  }

  Map<String, dynamic> toJason() {
    return {
      'name': name,
      'author': author,
      'image_link': image_link,
      'recipe': recipeSteps,
    };
  }

  @override
  String toString() {
    return 'Recipe(name: $name, author: $author, image_link: $image_link, recipeSteps: $recipeSteps)';
  }
}
