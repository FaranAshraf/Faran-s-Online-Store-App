import 'package:flutter/material.dart';
import 'package:fos/Data/my_cart_list.dart';
import 'package:fos/utils/my_app_colors.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({
    super.key,
  });

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppColors.primaryColor,
        title: const Text(
          'MY CART',
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: MyCartList.cartList.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> product = MyCartList.cartList[index];
                int counter = product['quantity'] ?? 1;
                num price = counter * product['price'];

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Image.network(product['image'] ?? ''),
                    ),
                    title: Row(
                      children: [
                        Text(
                          product['name'] ?? '',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            MyCartList.cartList.removeAt(index);

                            setState(() {});
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            if (counter > 1) {
                              counter--;
                            } else {
                              MyCartList.cartList.removeAt(index);
                            }
                            product['quantity'] = counter;
                            setState(() {});
                          },
                          child: const Text('-'),
                        ),
                        Text('$counter'),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                              product['quantity'] = counter;
                            });
                          },
                          child: const Text('+'),
                        ),
                        const Spacer(),
                        Text('Price : $price')
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: Text(
                    'Total Price:',
                    style: TextStyle(color: MyAppColors.primaryColor),
                  ),
                  trailing: Text(
                    MyCartList.calculateTotalPrice().toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => MyAppColors.primaryColor),
                ),
                child: Text(
                  'Check-Out',
                  style: TextStyle(color: MyAppColors.secondaryColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
