class Recipe {
  final String name;
  final String imageUrl;
  final double rating;
  final String totalTime;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.totalTime,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'] as String,
      imageUrl: json['images'][0]['hostedLargeUrl'] as String,
      rating: (json['rating'] as num).toDouble(), // Ensures rating is always a double
      totalTime: json['totalTime'] as String,
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, imageUrl: $imageUrl, rating: $rating, totalTime: $totalTime}';
  }
}
