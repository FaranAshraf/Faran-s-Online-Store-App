import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fos/screens/home_view.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  final TextEditingController _cellnumbereditingcontroller =
      TextEditingController();
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Please enter your contact number',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: AutofillHints.jobTitle),
              ),
              Row(
                children: [
                  const CountryCodePicker(
                    onChanged: print,
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'PK',
                    favorite: ['+92', 'BD'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                          backgroundColor: Colors.white, fontSize: 20),
                      controller: _cellnumbereditingcontroller,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.send,
                      decoration: const InputDecoration(
                          iconColor: Colors.grey,
                          border: OutlineInputBorder(),
                          labelText: 'enter number here!'),
                      onSubmitted: (value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromARGB(192, 232, 193, 114)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeView()));
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
