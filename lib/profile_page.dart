import 'package:flutter/material.dart';
import 'Models/person.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static String route = '/profile';

  @override
  Widget build(BuildContext context) {
    Person person = ModalRoute.of(context)?.settings.arguments as Person;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            )),
        backgroundColor: Colors.green,
        title: const Text(
          'Profile Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                'lib/images/user.png',
                height: 250,
                width: 150,
              ),
              Container(
                width: 300,
                margin: const EdgeInsets.only(bottom: 5, top: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'username:',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              // ignore: prefer_const_constructors
              TextFieldCustom(textLabel: person.username),
              Container(
                width: 300,
                margin: const EdgeInsets.only(bottom: 5, top: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'password:',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              TextFieldCustom(textLabel: person.password),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {super.key, required this.textLabel, this.isPassword = false});

  final String textLabel;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        obscureText: isPassword,
        controller: TextEditingController(text: textLabel),
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.5)),
        ),
      ),
    );
  }
}
