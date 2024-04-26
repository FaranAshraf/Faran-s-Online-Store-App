import 'package:flutter/material.dart';
import 'package:fos/custom%20widgets/title_and_price_widget.dart';
import 'package:fos/products/pants_list.dart';
import 'package:fos/products/shirts_list.dart';
import 'package:fos/products/shoes_list.dart';
import 'package:fos/screens/product_screen.dart';
import 'package:fos/products/watches_list.dart';
import 'package:fos/utils/my_app_colors.dart';

class ContainersRow extends StatelessWidget {
  final String catagories;

  const ContainersRow({
    Key? key,
    required this.catagories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoryproduct = [];
    if (catagories.toLowerCase() == 'watches') {
      categoryproduct = watchList();
    } else if (catagories.toLowerCase() == 'shoes') {
      categoryproduct = shoesList();
    } else if (catagories.toLowerCase() == 'shirts') {
      categoryproduct = shirtsList();
    } else if (catagories.toLowerCase() == 'pants') {
      categoryproduct = pantsList();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              catagories,
              style: TextStyle(color: MyAppColors.primaryColor, fontSize: 20),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  children: [
                    for (int i = 0; i < categoryproduct.length; i++)
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: GestureDetector(
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(categoryproduct[i]['image']!),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductScreen(
                                            product: categoryproduct[i],
                                          )));
                            },
                          ),
                        ),
                      ),
                  ],
                ),
                TitleAndPrice(whichList: catagories),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
