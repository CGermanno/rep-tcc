import 'package:flutter/material.dart';
import 'package:tcc_melhor_de_todos/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(hideBackButton: true),
      body: Container(
        color: const Color(0xFFFFFCF5),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Imagem decorativa (adicione a sua imagem de banner no assets e ajuste o path)
              Image.asset('lib/assets/img/receitas_banner.png', height: 180),

              const SizedBox(height: 30),

              Text(
                'O que você tem em casa hoje?',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Text(
                'Informe os ingredientes disponíveis e descubra receitas incríveis!',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/search'),
                icon: const Icon(Icons.search),
                label: const Text(
                  'Buscar por Ingredientes',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE67E22),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  shadowColor: Colors.orange.withOpacity(0.3),
                ),
              ),

              const SizedBox(height: 30),

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
                    label: 'Compras',
                    route: '/shoppingList',
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
      ),
    );
  }

  Widget _buildOptionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
  }) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFDEBD0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(icon, size: 28, color: Color(0xFFE67E22)),
            onPressed: () => Navigator.pushNamed(context, route),
            tooltip: label,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
