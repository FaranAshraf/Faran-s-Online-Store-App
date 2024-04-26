import 'package:flutter/material.dart';
import 'package:fos/Data/profile_data.dart';
import 'package:fos/utils/my_app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppColors.primaryColor,
        title: const Text(
          'PROFILE',
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            shape: Border(
                bottom: BorderSide(width: 2, color: MyAppColors.primaryColor)),
            title: Text(
              'Name: ${ProfileData.profileList.first['Name'] ?? ''}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            shape: Border(
                bottom: BorderSide(width: 2, color: MyAppColors.primaryColor)),
            title: Text(
              'Phone: ${ProfileData.profileList[0]['Phone'] ?? ''}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
