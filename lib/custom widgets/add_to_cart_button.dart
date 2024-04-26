import 'package:flutter/material.dart';
import 'package:fos/Data/my_cart_list.dart';
import 'package:fos/utils/my_app_colors.dart';

class AddToCartButton extends StatefulWidget {
  final Map<String, dynamic> product;

  const AddToCartButton({Key? key, required this.product}) : super(key: key);
  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool isPressed = false;
  @override
  void initState() {
    super.initState();

    if (MyCartList.cartList.contains(widget.product)) {
      isPressed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isPressed
          ? () {
              setState(() {
                isPressed = true;
                MyCartList.addProduct(widget.product);
              });
            }
          : () {},
      style: ButtonStyle(
        backgroundColor: !isPressed
            ? MaterialStateColor.resolveWith(
                (states) => MyAppColors.primaryColor)
            : MaterialStateColor.resolveWith(
                (states) => MyAppColors.secondaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: !isPressed
            ? Text(
                'Add to Cart',
                style: TextStyle(color: MyAppColors.secondaryColor),
              )
            : Text(
                'Added to Cart',
                style: TextStyle(color: MyAppColors.primaryColor),
              ),
      ),
    );
  }
}
