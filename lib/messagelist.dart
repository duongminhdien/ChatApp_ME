import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessagesPage extends StatelessWidget {
  MessagesPage({super.key});
  final List<Message> messages = [
    Message('Cameron Williamson', 'omg, this is amazing', '14:32', 2,
        'assets/cameron.png'),
    Message('Arlene McCoy', 'I\'ll be there in 2 mins', '12:32', 2,
        'assets/arlene.png'),
    Message('Darlene Robertson', 'Hey bro!', '01:42', 2, 'assets/darlene.png'),
    Message('Jenny Wilson', 'wooooooo', '01:22', 0, 'assets/jenny.png'),
    Message(
        'Annette Black', 'How are you?', 'Mon, 22:23', 0, 'assets/annette.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      backgroundColor: Colors.white,
      //Display the message list
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return MessageCard(messages[index]);
        },
      ),
      //Floating action button to add a new message
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset('assets/images/new_message.png'),
        backgroundColor: Color.fromRGBO(74, 63, 105, 1),
        shape: CircleBorder(),
      ),

      //Bottom navigation bar with icons and labels
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/message.png")),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/call.png")), label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/contact.png")),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/settings.png")),
              label: ''),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  //const MessageTitle({super.key});
  final Message message;

  MessageCard(this.message);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //Avatar
      leading: CircleAvatar(
        backgroundImage: AssetImage(message.avatarUrl),
        radius: 24,
      ),
      //Message Username and Comment
      title: Text(
        message.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(message.lastMessage),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message.time, style: TextStyle(color: Colors.grey)),
          if (message.unreadCount > 0)
            Container(
              margin: EdgeInsets.only(top: 4),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                message.unreadCount > 99
                    ? '99+'
                    : message.unreadCount.toString(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(horizontal: 17),
    );
  }
}

class Message {
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String avatarUrl;

  Message(
      this.name, this.lastMessage, this.time, this.unreadCount, this.avatarUrl);
}
