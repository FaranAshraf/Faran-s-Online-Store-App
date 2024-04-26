import 'package:flutter/material.dart';
import 'package:fos/custom%20widgets/containers_widget.dart';
import 'package:fos/screens/favorites_screen.dart';
import 'package:fos/screens/login.dart';
import 'package:fos/screens/my_cart_screen.dart';
import 'package:fos/screens/profile_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCartScreen(),
                  ));
            },
            icon: const Icon(Icons.shopping_cart_outlined),
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritesScreen(),
                  ));
            },
            color: Colors.red,
            iconSize: 40,
            icon: const Icon(Icons.favorite_border),
          ),
          const Icon(
            Icons.search,
            size: 40,
          ),
          IconButton(
            icon: const Icon(Icons.person_outlined),
            iconSize: 40,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ]),
      ],
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 150,
              color: const Color(0xffDB3022),
              child: const Text(
                "Faran's Online Store",
                style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: const ListTile(
                title: Text('Profile'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoritesScreen(),
                    ));
              },
              child: const ListTile(
                title: Text('Favorites'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const ListTile(
                title: Text('Log Out'),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Color(0xffFFFFFF),
          ),
        ),
        actions: const [
          Icon(
            Icons.location_pin,
            color: Color(0xffFFFFFF),
          ),
          Text('Karachi,Pakistan',
              style: TextStyle(
                color: Color(0xffFFFFFF),
              ))
        ],
        backgroundColor: const Color(0xffDB3022),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ContainersRow(catagories: 'WATCHES'),
            ContainersRow(catagories: 'SHOES'),
            ContainersRow(catagories: 'SHIRTS'),
            ContainersRow(catagories: 'PANTS'),
          ],
        ),
      ),
    );
  }
}
