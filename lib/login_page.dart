

import 'package:flutter/material.dart';

import 'Models/person.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static String route = '/login';
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Login Page',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 45),
              Image.asset(
                'lib/images/user.png',
                height: 250,
                width: 150,
                alignment: Alignment.topCenter,
              ),
              TextFieldCustom(
                textLabel: 'Email',
                text: email,
              ),
              const SizedBox(height: 20),
              TextFieldCustom(
                text: password,
                textLabel: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (email.text == 'hasan' && password.text == 'h1') {
                      Navigator.of(context).pushNamed('/home',
                          arguments: Person(email.text, password.text));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('success'),
                        backgroundColor: Colors.green,
                        showCloseIcon: true,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid Email or Password'),
                          backgroundColor: Colors.red,
                          showCloseIcon: true,
                        ),
                      );
                    }
                  },
                  child: const Text('Login', style: TextStyle(fontSize: 25)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom(
      {super.key,
      required this.textLabel,
      this.isPassword = false,
      required this.text});

  TextEditingController text;
  final String textLabel;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: text,
        obscureText: isPassword,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          label: Text(
            textLabel,
            style: const TextStyle(fontSize: 23, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
