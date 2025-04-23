import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriasPage extends StatelessWidget {
  const CategoriasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(context));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFE67E22),
      title: Text(
        'Categorias',
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.3),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(context, category: _categories[index]);
        },
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required Category category,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.2),
      color: category.color,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _navigateToCategory(context, category),
        splashColor: Colors.white.withOpacity(0.2),
        highlightColor: Colors.white.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(category.icon, size: 40, color: Colors.white),
              const SizedBox(height: 2),
              Text(
                category.label,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                category.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToCategory(BuildContext context, Category category) {
    // Implemente a navegação para a tela específica da categoria
    // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailsPage(category: category)));
  }
}

// Modelo de dados para categorias
class Category {
  final IconData icon;
  final String label;
  final Color color;
  final String description;

  Category({
    required this.icon,
    required this.label,
    required this.color,
    required this.description,
  });
}

// Lista de categorias (pode ser movida para um arquivo separado)
final List<Category> _categories = [
  Category(
    icon: Icons.eco,
    label: 'Vegan',
    color: Colors.green.shade400,
    description: 'Receitas sem produtos de origem animal.',
  ),
  Category(
    icon: Icons.clear_all,
    label: 'Intolerantes',
    color: Colors.blue.shade400,
    description: 'Receitas para intolerantes a leite, glúten, etc.',
  ),
  Category(
    icon: Icons.fitness_center,
    label: 'Fitness',
    color: Colors.orange.shade400,
    description: 'Receitas para manter uma alimentação saudável.',
  ),
  Category(
    icon: Icons.warning,
    label: 'Alérgicos',
    color: Colors.red.shade400,
    description: 'Receitas para pessoas com alergias alimentares.',
  ),
];
