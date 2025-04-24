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
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait ? 2 : 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isPortrait ? 1 : 1.3,
              ),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryCard(
                  context,
                  category: _categories[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Explore nossas categorias',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Encontre receitas perfeitas para suas necessidades',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required Category category,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _navigateToCategory(context, category),
        splashColor: Colors.white.withOpacity(0.2),
        highlightColor: Colors.white.withOpacity(0.1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [category.color, category.color.withOpacity(0.8)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  category.icon,
                  size: MediaQuery.of(context).size.width * 0.1,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                Text(
                  category.label,
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  category.description,
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
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

final List<Category> _categories = [
  Category(
    icon: Icons.eco,
    label: 'Vegan',
    color: const Color(0xFF4CAF50),
    description: 'Receitas sem produtos de origem animal',
  ),
  Category(
    icon: Icons.health_and_safety,
    label: 'Intolerantes',
    color: const Color(0xFF2196F3),
    description: 'Para intolerantes a lactose, glúten, etc.',
  ),
  Category(
    icon: Icons.fitness_center,
    label: 'Fitness',
    color: const Color(0xFFFF9800),
    description: 'Receitas saudáveis para seu treino',
  ),
  Category(
    icon: Icons.warning,
    label: 'Alérgicos',
    color: const Color(0xFFF44336),
    description: 'Receitas sem alérgenos comuns',
  ),
  Category(
    icon: Icons.child_care,
    label: 'Infantil',
    color: const Color(0xFF9C27B0),
    description: 'Receitas divertidas para crianças',
  ),
  Category(
    icon: Icons.cake,
    label: 'Sobremesas',
    color: const Color(0xFFE91E63),
    description: 'Doces deliciosos para qualquer ocasião',
  ),
];
