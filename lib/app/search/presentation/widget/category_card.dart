import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;

  Category({required this.name, required this.icon, required this.color});
}

final List<Category> categories = [
  Category(name: 'Beauty', icon: Icons.spa, color: Colors.pinkAccent),
  Category(name: 'Gadgets', icon: Icons.laptop_mac, color: Colors.amber),
  Category(name: 'Games', icon: Icons.gamepad, color: Colors.green),
  Category(name: 'Dine', icon: Icons.dining_outlined, color: Colors.redAccent),
  Category(name: 'Sport', icon: Icons.fitness_center, color: Colors.blueAccent),
];

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: category.color.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 9,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(category.icon, size: 40),
          const SizedBox(height: 12),
          Text(category.name, style: TextTheme.of(context).titleMedium),
        ],
      ),
    );
  }
}
