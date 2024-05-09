import 'package:flutter/material.dart';
import 'package:fos/Data/favorite_list.dart';
import 'package:fos/utils/my_app_colors.dart';

class FavoritesScreen extends StatefulWidget {
  final VoidCallback? isUnFavorite;
  const FavoritesScreen({Key? key, this.isUnFavorite}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppColors.primaryColor,
        title: Text(
          'FAVORITES',
          style: TextStyle(color: MyAppColors.secondaryColor),
        ),
      ),
      body: ListView.builder(
        itemCount: FavoriteList.favoritesList.length,
        itemBuilder: (context, index) {
          final Map<String, dynamic> product =
              FavoriteList.favoritesList[index];
          return ListTile(
            shape: Border(
                bottom: BorderSide(width: 2, color: MyAppColors.primaryColor)),
            leading: CircleAvatar(
              child: Image.network(product['image'] ?? ''),
            ),
            title: Text(product['name'] ?? ''),
            subtitle: Text(product['price'].toString()),
            trailing: IconButton(
                onPressed: () {
                  FavoriteList.removeProduct(product);
                  widget.isUnFavorite?.call();
                  setState(() {});
                },
                icon: const Icon(Icons.delete)),
          );
        },
      ),
    );
  }
}
