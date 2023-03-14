import 'package:flutter/material.dart';

class ProductGridLoading extends StatelessWidget {
  const ProductGridLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.grey[350],
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.grey[400],
                ),
                color: Colors.grey[400],
              ),
              title: Container(
                height: 10,
                color: Colors.grey[400],
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey[400],
                ),
              ),
            ),
            child: Container(
              color: Colors.grey[200],
            ),
          ),
        );
      },
    );
  }
}
