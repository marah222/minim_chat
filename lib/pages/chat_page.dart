import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat/components/my_text_field.dart';
import 'package:minimal_chat/services/auth/auth_service.dart';
import 'package:minimal_chat/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverId;

  ChatPage({super.key, required this.receiverEmail, required this.receiverId});

//text controller
  final TextEditingController _messageController = TextEditingController();

  // chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //send message
  void sendMessage() async {
    // if there is something the textfield
    if (_messageController.text.isNotEmpty) {
      //senf message
      await _chatService.sendMessage(receiverId, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail)),
      body: Column(
        children: [
          //display all messages
          Expanded(child: _buildMessageList()),
          //user input
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverId, senderId),
        builder: (context, snapshot) {
          //errors
          if (snapshot.hasError) {
            return Text("Error");
          }
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }
          // return list view
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data["message"]);
  }

  // user input
  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
            child: MyTextField(
          controller: _messageController,
          hintText: "Type a message",
          obscureText: false,
        )),
        //send button
        IconButton(onPressed: sendMessage, icon: Icon(Icons.send))
      ],
    );
  }
}
