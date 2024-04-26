import 'package:flutter/material.dart';
import 'package:fos/products/pants_list.dart';
import 'package:fos/products/shirts_list.dart';
import 'package:fos/products/shoes_list.dart';
import 'package:fos/products/watches_list.dart';

class TitleAndPrice extends StatelessWidget {
  final String whichList;
  const TitleAndPrice({
    Key? key,
    required this.whichList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> itemList = [];
    if (whichList.toLowerCase() == 'watches') {
      itemList = watchList();
    } else if (whichList.toLowerCase() == 'shoes') {
      itemList = shoesList();
    } else if (whichList.toLowerCase() == 'shirts') {
      itemList = shirtsList();
    } else if (whichList.toLowerCase() == 'pants') {
      itemList = pantsList();
    }

    return Row(
      children: [
        for (int i = 0; i < itemList.length; i++)
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 200,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    itemList[i]['name'] ?? '',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(itemList[i]['price'].toString()),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
