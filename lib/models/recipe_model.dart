class Recipe {
  final String id; // ID único (gerado pelo GPT-4o ou Firebase)
  final String title;
  final String category;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTime; // em minutos
  final String? imageUrl; // opcional
  final String? difficulty; // opcional (ex: "Fácil", "Médio")

  Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.ingredients,
    required this.instructions,
    required this.prepTime,
    this.imageUrl,
    this.difficulty,
  });

  // Converte para Map (usado no Firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTime': prepTime,
      'difficulty': difficulty,
      'imageUrl': imageUrl,
    };
  }

  // Cria a partir de Map (vindo do Firestore/API)
  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'] ?? '', // Fallback para evitar null
      title: map['title'] ?? 'Sem título',
      category: map['category'] ?? 'Geral',
      ingredients: List<String>.from(map['ingredients'] ?? []),
      instructions: List<String>.from(map['instructions'] ?? []),
      prepTime: map['prepTime']?.toInt() ?? 0,
      difficulty: map['difficulty'],
      imageUrl: map['imageUrl'],
    );
  }

  // Cópia com alterações (útil para favoritos)
  Recipe copyWith({
    String? id,
    String? title,
    String? category,
    List<String>? ingredients,
    List<String>? instructions,
    int? prepTime,
    String? difficulty,
    String? imageUrl,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      prepTime: prepTime ?? this.prepTime,
      difficulty: difficulty ?? this.difficulty,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  // Método para debug (opcional)
  @override
  String toString() {
    return 'Recipe($title, $prepTime min, $ingredients)';
  }
}
