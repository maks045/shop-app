import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/theme/app_theme.dart';
import 'app/cart/presentation/cart_screen.dart';
import 'app/profile/profile_screen.dart';
import 'app/search/search_screen.dart';
import 'app/shop/presentation/shop_screen.dart';
import 'app/wishlist/wish_list_screen.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class ShopAppScreen extends ConsumerWidget {
  const ShopAppScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavIndexProvider);

    final pages = [
      const ShopScreen(),
      const SearchScreen(),
      const CartScreen(),
      const WishListScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => ref.read(bottomNavIndexProvider.notifier).state = i,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
