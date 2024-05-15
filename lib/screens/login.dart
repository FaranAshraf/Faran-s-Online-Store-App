import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fos/Data/profile_data.dart';
import 'package:fos/screens/home_view.dart';
import 'package:fos/screens/number.dart';
import 'package:fos/utils/my_app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
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
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 100, bottom: 20),
                  child: const Text(
                    'Get Yourself \n Registered',
                    style: TextStyle(
                        color: Color.fromARGB(125, 255, 255, 255),
                        fontSize: 40,
                        fontFamily: AutofillHints.jobTitle),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 8, left: 20),
                          width: 80,
                          child: const Text(
                            'Name :',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffFFFFFF),
                            ),
                          )),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                              color: Color(0xffFFFFFF), fontSize: 20),
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.send,
                          decoration: const InputDecoration(
                              iconColor: Color(0xffFFFFFF),
                              border: OutlineInputBorder(),
                              labelText: 'enter name here!'),
                          onSubmitted: (value) {
                            ProfileData.addprofileMap({'Name': value});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const CountryCodePicker(
                      textStyle: TextStyle(color: Color(0xffFFFFFF)),
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
                            color: Color(0xffFFFFFF), fontSize: 20),
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.send,
                        decoration: const InputDecoration(
                            iconColor: Color(0xffFFFFFF),
                            border: OutlineInputBorder(),
                            labelText: 'enter number here!'),
                        onSubmitted: (value) {
                          ProfileData.addprofileMap({'Phone': value});
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => MyAppColors.primaryColor),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) => const HomeView(),
                              transitionsBuilder: (_, animation, __, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(1.0,
                                        0.0), // Start off-screen to the right
                                    end: Offset
                                        .zero, // Slide to the center of the screen
                                  ).animate(animation),
                                  child: child,
                                );
                              }),
                        );
                        setState(() {
                          ProfileData.addprofileMap({
                            'Name': _nameController.text,
                            'Phone': _phoneNumberController.text,
                          });
                        });
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Color(0xffFFFFFF)),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80, bottom: 10),
                  child: const Text(
                    '----------------------OR------------------------',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffFFFFFF),
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(192, 232, 193, 114)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NumberPage()));
                    },
                    child: const Text(
                      'Connect with Google',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(128, 14, 118, 203)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NumberPage()));
                  },
                  child: const Text(
                    'Connect with Facebook',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
