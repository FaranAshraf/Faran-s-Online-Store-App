import 'package:flutter/material.dart';
import 'package:fos/utils/my_app_colors.dart';

class DrawerButton extends StatefulWidget {
  const DrawerButton({super.key});

  @override
  State<DrawerButton> createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: MyAppColors.primaryColor,
          child: Text(
            "Faran's Online Store",
            style: TextStyle(fontSize: 40, color: MyAppColors.secondaryColor),
          ),
        ),
        const ListTile(
          title: Text('Favorites'),
        ),
        const ListTile(
          title: Text('Profile'),
        ),
        const ListTile(
          title: Text('Log Out'),
        )
      ],
    );
  }
}
