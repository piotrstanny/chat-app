import 'package:flutter/material.dart';
import 'message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesStream extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data.docs;
          List<MessageBubble> messageBubbles = [];

          for (var message in messages) {
            final messageSender = message.get('sender');
            final messageText = message.get('text');
            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageBubbles,
            ),
          );
        } else {
          return Text('Loading...');
        }
      },
    );
  }
}
