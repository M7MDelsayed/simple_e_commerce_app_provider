import 'package:e_commerce_app/pages/login.dart';
import 'package:e_commerce_app/shared/colors.dart';
import 'package:e_commerce_app/shared/custom_textfield.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  const MyTextField(
                      hintTextt: 'Enter Your User Name',
                      isPassword: false,
                      textInputTypee: TextInputType.text),
                  const SizedBox(
                    height: 33,
                  ),
                  const MyTextField(
                      hintTextt: 'Enter Your Email',
                      isPassword: false,
                      textInputTypee: TextInputType.emailAddress),
                  const SizedBox(
                    height: 33,
                  ),
                  const MyTextField(
                      hintTextt: 'Enter Your Password',
                      isPassword: true,
                      textInputTypee: TextInputType.text),
                  const SizedBox(
                    height: 33,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(bTNgreen),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(12),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
