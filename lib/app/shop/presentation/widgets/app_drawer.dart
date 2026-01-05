import 'package:flutter/material.dart';
import 'package:shop_app/core/extensions/router_extension.dart';

import '../../../../core/theme/gradient.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          gradient: Gradients.blueGradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.close),
              ),
            ),
            ListTile(title: Text('Account')),
            ListTile(title: Text('Activity')),
            ListTile(title: Text('My Orders')),
            ListTile(title: Text('Messages')),
            ListTile(title: Text('Support')),
          ],
        ),
      ),
    );
  }
}
