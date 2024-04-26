import 'package:flutter/material.dart';
import 'package:fos/Data/favorite_list.dart';

import 'package:fos/screens/favorites_screen.dart';

class FavoriteButton extends StatefulWidget {
  final Map<String, dynamic> product;

  const FavoriteButton({Key? key, required this.product}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    bool isPressed =
        FavoriteList.favoritesList.contains(widget.product) ? true : false;
    return GestureDetector(
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FavoritesScreen()),
        );
      },
      onTap: () {
        setState(() {
          isPressed = !isPressed;

          isPressed
              ? FavoriteList.addProduct(widget.product)
              : FavoriteList.removeProduct(widget.product);
        });
      },
      child: Icon(
        isPressed ? Icons.favorite : Icons.favorite_border,
        color: isPressed ? Colors.red : null,
      ),
    );
  }
}
