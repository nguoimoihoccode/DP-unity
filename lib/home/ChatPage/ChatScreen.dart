import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideco_app/home/ChatPage/BuildHeaderChat.dart';
import 'package:ideco_app/home/ChatPage/BuildListChat.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Buildheaderchat(),
            _buildSearchBar(),
            Buildlistchat(),
            _buildButtonCreateGroupChat(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Tìm kênh chat',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonCreateGroupChat() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.all(20),
        width: 80.0,
        height: 80.0,
        child: ElevatedButton(
          style: ButtonStyle(
            
          ),
          onPressed: () {},
          child: const Text(
            '+',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.black,
            ),
            ),  // trying to move to the bottom
        ),
      ),
    );
  }
}
