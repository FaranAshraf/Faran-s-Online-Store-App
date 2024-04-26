import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextEditingController code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Login.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              const Text(
                'Please enter your code here!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              TextField(
                controller: code,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.send,
                decoration: const InputDecoration(
                  iconColor: Colors.grey,
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
