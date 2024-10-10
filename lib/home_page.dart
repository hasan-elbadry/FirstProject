import 'dart:developer';

import 'package:flutter/material.dart';

import 'Models/person.dart';
import 'chat_page.dart';
import 'profile_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var number = 0;

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
              onPressed: () {
                Person person =
                    ModalRoute.of(context)?.settings.arguments as Person;
                log('${person.username}    ${person.password}');
                Navigator.of(context)
                    .pushNamed(ProfilePage.route, arguments: person);
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ChatPage.route);
              },
              icon: const Icon(
                Icons.chat_bubble,
                color: Colors.white,
                size: 30,
              ))
        ],
        backgroundColor: Colors.green,
        title: const Text(
          'AHM Project',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(50),
              child: CircleAvatar(
                radius: 50,
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRacQ9rNiaYiIDw_aCFHjpMp5C5s5vMcKHBGQ&s'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 100),
              child: Text(
                '$number',
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      number++;
                    });
                  },
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      number == 0 ? number = 0 : number--;
                    });
                  },
                  shape: const CircleBorder(),
                  child: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
