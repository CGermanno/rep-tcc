// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/recipe_model.dart';
// import '../config.dart'; // Adicione no topo do arquivo

// class GptService {
//   final String _apiKey = openAiKey; // 👈 Agora usa a variável do config.dart
//   final String _baseUrl = 'https://api.openai.com/v1/chat/completions';

//   // Busca receitas baseadas em ingredientes
//   Future<List<Recipe>> getRecipesByIngredients(List<String> ingredients) async {
//     final prompt = '''
//     Me forneça 3 receitas usando os seguintes ingredientes: ${ingredients.join(', ')}.
//     Para cada receita, retorne APENAS um JSON com a seguinte estrutura:
//     {
//       "title": "Nome da receita",
//       "category": "Categoria",
//       "ingredients": ["ingrediente1", "ingrediente2"],
//       "instructions": ["passo1", "passo2"],
//       "prepTime": 30
//     }
//     ''';

//     try {
//       final response = await http.post(
//         Uri.parse(_baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $_apiKey',
//         },
//         body: jsonEncode({
//           'model': 'gpt-4', // Substitua pelo modelo correto
//           'messages': [
//             {'role': 'user', 'content': prompt},
//           ],
//           'temperature': 0.7,
//         }),
//       );

//       if (response.statusCode == 200) {
//         return _parseResponse(response.body);
//       } else {
//         throw Exception('Falha na API: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Erro ao conectar: $e');
//     }
//   }

//   List<Recipe> _parseResponse(String responseBody) {
//     final jsonResponse = jsonDecode(responseBody);
//     final content = jsonResponse['choices'][0]['message']['content'];

//     // Extrai os blocos JSON da resposta
//     final jsonBlocks = RegExp(r'\{.*?\}', dotAll: true).allMatches(content);

//     return jsonBlocks.map((match) {
//       return Recipe.fromMap(jsonDecode(match.group(0)!));
//     }).toList();
//   }
// }
