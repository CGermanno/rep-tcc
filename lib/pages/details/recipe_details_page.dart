// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../../models/recipe_model.dart';
// import '../../services/firebase_service.dart';
// import '../../widgets/custom_app_bar.dart';

// class RecipeDetailsPage extends StatefulWidget {
//   final Recipe recipe;
//   const RecipeDetailsPage({super.key, required this.recipe});

//   @override
//   State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
// }

// class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
//   bool _isFavorite = false;
//   bool _isLoading = false;
//   final FirebaseService _firebaseService = FirebaseService();

//   @override
//   void initState() {
//     super.initState();
//     _checkIfFavorite();
//   }

//   Future<void> _checkIfFavorite() async {
//     setState(() => _isLoading = true);
//     try {
//       final isFav = await _firebaseService.isFavorite(widget.recipe.id);
//       setState(() => _isFavorite = isFav);
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _toggleFavorite() async {
//     setState(() => _isFavorite = !_isFavorite);
//     try {
//       if (_isFavorite) {
//         await _firebaseService.saveFavorite(
//           recipeId: widget.recipe.id,
//           recipeData: widget.recipe.toMap(),
//         );
//       } else {
//         await _firebaseService.removeFavorite(widget.recipe.id);
//       }
//     } catch (e) {
//       setState(() => _isFavorite = !_isFavorite); // Revert on error
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('Erro: ${e.toString()}')));
//     }
//   }

//   Future<void> _addToShoppingList() async {
//     try {
//       await _firebaseService.addToShoppingList(widget.recipe.ingredients);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Ingredientes adicionados à lista!')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('Erro: ${e.toString()}')));
//     }
//   }

//   Future<void> _copyRecipeToClipboard() async {
//     final recipeText = '''
// ${widget.recipe.title}

// Ingredientes:
// ${widget.recipe.ingredients.map((e) => '• $e').join('\n')}

// Modo de Preparo:
// ${widget.recipe.instructions.asMap().entries.map((e) => '${e.key + 1}. ${e.value}').join('\n')}
// ''';
//     await Clipboard.setData(ClipboardData(text: recipeText));
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(const SnackBar(content: Text('Receita copiada!')));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: widget.recipe.title,
//         actions: [
//           IconButton(
//             icon:
//                 _isLoading
//                     ? const CircularProgressIndicator()
//                     : Icon(
//                       _isFavorite ? Icons.favorite : Icons.favorite_border,
//                       color: _isFavorite ? Colors.red : null,
//                     ),
//             onPressed: _isLoading ? null : _toggleFavorite,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Cabeçalho (Categoria e Tempo)
//             Row(
//               children: [
//                 Chip(label: Text(widget.recipe.category)),
//                 const SizedBox(width: 8),
//                 const Icon(Icons.timer, size: 16),
//                 const SizedBox(width: 4),
//                 Text('${widget.recipe.prepTime} min'),
//                 if (widget.recipe.difficulty != null) ...[
//                   const SizedBox(width: 8),
//                   Chip(
//                     label: Text(widget.recipe.difficulty!),
//                     backgroundColor: Colors.green[100],
//                   ),
//                 ],
//               ],
//             ),
//             const SizedBox(height: 16),

//             // Ingredientes
//             const Text(
//               'Ingredientes:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             ...widget.recipe.ingredients.map((ing) => Text('• $ing')).toList(),

//             const Divider(height: 32),

//             // Modo de Preparo
//             const Text(
//               'Modo de Preparo:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             ...widget.recipe.instructions
//                 .asMap()
//                 .entries
//                 .map(
//                   (e) => Padding(
//                     padding: const EdgeInsets.only(bottom: 8),
//                     child: Text('${e.key + 1}. ${e.value}'),
//                   ),
//                 )
//                 .toList(),

//             // Botões de Ação
//             const SizedBox(height: 24),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton.icon(
//                     icon: const Icon(Icons.shopping_cart),
//                     label: const Text('Adicionar à Lista'),
//                     onPressed: _addToShoppingList,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: OutlinedButton.icon(
//                     icon: const Icon(Icons.copy),
//                     label: const Text('Copiar'),
//                     onPressed: _copyRecipeToClipboard,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
