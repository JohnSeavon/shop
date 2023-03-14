import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(this.cartItem, {super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Card(
        color: Theme.of(context).colorScheme.errorContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: ListTile(
            leading: Chip(
              padding: const EdgeInsets.symmetric(vertical: 15),
              backgroundColor: Theme.of(
                context,
              ).colorScheme.error.withOpacity(0.4),
              side: BorderSide.none,
              label: Text(
                '\$${cartItem.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
            ),
            title: Text('${cartItem.quantity}x ${cartItem.name}'),
            subtitle: Text(
              'Total: \$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
            ),
            trailing: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.onErrorContainer,
              size: 30,
            ),
          ),
        ),
      ),
      onDismissed: (_) {
        cart.removeItem(cartItem.productId);
      },
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              'Remove this item from cart?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            content: Card(
              child: ListTile(
                title: Text('${cartItem.name} - \$ ${cartItem.price}'),
                subtitle: Text(
                  '${cartItem.quantity}x - Total: \$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: const Text('Remove'),
              ),
            ],
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListTile(
            leading: Chip(
              padding: const EdgeInsets.symmetric(vertical: 15),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              side: BorderSide.none,
              label: Text(
                '\$${cartItem.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
            ),
            title: Text(cartItem.name),
            subtitle: Text(
              'Total: \$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
            ),
            trailing: Chip(
              side: BorderSide.none,
              deleteIcon: const Icon(
                Icons.remove,
                size: 22,
              ),
              onDeleted: () {
                cart.removeSingleItem(cartItem.productId);
              },
              label: Text('${cartItem.quantity}x'),
            ),
          ),
        ),
      ),
    );
  }
}
