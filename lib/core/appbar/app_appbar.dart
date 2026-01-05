import 'package:flutter/material.dart';
import 'package:shop_app/core/extensions/router_extension.dart';

import '../../app/cart/presentation/cart_screen.dart';

class AppAppbar extends StatelessWidget {
  const AppAppbar({
    super.key,
    this.title,
    this.isBack,
    this.isCart,
    this.isSearch,
    this.isNotification,
    this.isMenu,
  });
  final String? title;
  final bool? isBack;
  final bool? isCart;
  final bool? isSearch;
  final bool? isNotification;
  final bool? isMenu;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      leading: isBack == true
          ? IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back),
      )
          : isMenu == true
          ? Builder(
        builder: (context) => IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer(); // now works
          },
          icon: const Icon(Icons.menu),
        ),
      )
          : null,
      actions: [
        if (isCart == true)
          IconButton(
            onPressed: () => context.push(const CartScreen()),
            icon: const Icon(Icons.shopping_cart),
          ),
        if (isSearch == true)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        if (isNotification == true)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
      ],
    );
  }}
