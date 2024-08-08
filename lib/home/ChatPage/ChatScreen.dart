import 'package:flutter/material.dart';
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
}
