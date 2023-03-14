import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 0) {
          Navigator.of(context).pushReplacementNamed(
            AppRoutes.home,
          );
        }
        if (index == 1) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(
            AppRoutes.orders,
          );
        }
        if (index == 2) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(
            AppRoutes.products,
          );
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person),
              Text(
                'Welcome User!',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.shopping_bag),
          label: Text('Shop'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.delivery_dining),
          label: Text('Orders'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.edit),
          label: Text('Manage products'),
        ),
      ],
    );
  }
}
