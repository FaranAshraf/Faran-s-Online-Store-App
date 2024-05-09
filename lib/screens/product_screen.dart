import 'package:flutter/material.dart';
import 'package:fos/custom%20widgets/add_to_cart_button.dart';
import 'package:fos/custom%20widgets/favorite_button.dart';
import 'package:fos/utils/my_app_colors.dart';

class ProductScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 0),
              itemCount: 1,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Image.network(widget.product['image'] ?? ''),
                    ListTile(
                      title: Text(widget.product['name'] ?? ''),
                      subtitle:
                          Text("PRICE : ${widget.product['price'].toString()}"),
                      trailing: FavoriteButton(
                        isUnFavorite: () {
                          setState(() {});
                        },
                        product: widget.product,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Text("MODEL : ${widget.product['model'] ?? ''}"),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 30)),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Text(
                        '~Free Delivery! \n ~Two Years Warranty \n ~Limited Stocks',
                        style: TextStyle(color: MyAppColors.primaryColor),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: AddToCartButton(
              product: widget.product,
            ),
          ),
        ],
      ),
    );
  }
}
