import 'package:flutter/material.dart';
import 'package:tcc_melhor_de_todos/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        // title: 'Receitas do Seu Jeito',
        hideBackButton: true, // desativa o botão de voltar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Text(
              'O que você tem em casa hoje?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Informe os ingredientes disponíveis e descubra receitas incríveis!',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Botão principal
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/search'),
              icon: const Icon(Icons.search),
              label: const Text(
                'Buscar por Ingredientes',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE67E22),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Botões secundários
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOptionButton(
                  context,
                  icon: Icons.favorite,
                  label: 'Favoritos',
                  route: '/favorites',
                ),
                _buildOptionButton(
                  context,
                  icon: Icons.shopping_cart,
                  label: 'Lista de Compras',
                  route:
                      '/shoppingList', // Rota para a tela de lista de compras
                ),
                _buildOptionButton(
                  context,
                  icon: Icons.category,
                  label: 'Categorias',
                  route: '/categories',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Botão estilo card
  Widget _buildOptionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
  }) {
    return Column(
      children: [
        Ink(
          decoration: const ShapeDecoration(
            color: Color(0xFFFDEBD0),
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(icon, size: 30, color: Color(0xFFE67E22)),
            onPressed: () => Navigator.pushNamed(context, route),
            tooltip: label,
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
