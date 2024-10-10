import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  static String route = '/chat';
  var names = ['hasan', 'ahmed', 'akram', 'mohmed walid', 'momen'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: const CircleAvatar(
            backgroundImage: AssetImage('lib/images/user.png'),
          ),
        ),
        title: const Text(
          "Chats",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        actions: const [
          Icon(
            Icons.camera_alt_rounded,
            size: 30,
          ),
          SizedBox(width: 15),
          Icon(
            Icons.edit_document,
            size: 30,
          ),
          SizedBox(width: 15)
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => chatItem(names[index]),
        itemCount: 5,
      ),
    );
  }
}

Widget chatItem(String name) => Container(
      color: Colors.white70,
      height: 70,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: Image.asset(
                  'lib/images/user.png',
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    'data . now',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )
                ],
              ),
            ],
          ),
          const Icon(
            Icons.check_circle,
            color: Colors.grey,
          )
        ],
      ),
    );
