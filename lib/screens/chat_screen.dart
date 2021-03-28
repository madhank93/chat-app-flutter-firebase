import 'package:chat_app/db/chat_message.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/services/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/constants/styles.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String _messgae;
  late final User _signedInUsers;
  late final Stream<QuerySnapshot> _messages;

  @override
  void initState() {
    super.initState();
    _signedInUsers = FireBaseAuthService.getSignedInUsers()!;
    _messages = ChatMessage().getStreamOfMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                FireBaseAuthService.logout();
                Navigator.of(context).pop();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(messages: _messages),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        _messgae = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: _sendChatMessage,
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendChatMessage() {
    Message msg =
        Message(message: _messgae, senderName: _signedInUsers.email!, uuid: "");
    ChatMessage().add(msg.toJson());
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({
    Key? key,
    required Stream<QuerySnapshot> messages,
  })   : _messages = messages,
        super(key: key);

  final Stream<QuerySnapshot> _messages;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _messages,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          late Widget children;
          if (snapshot.hasError) {
            children = Center(child: Text("Failed to load"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            children = Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          } else if (snapshot.hasData) {
            children = Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data!.size,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data!.docs[index]['message'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return children;
        });
  }
}
