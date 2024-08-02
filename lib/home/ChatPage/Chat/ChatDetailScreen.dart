import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> messages = [];
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  Map<String, ImageProvider> avatarCache = {};

  @override
  void initState() {
    super.initState();
  }

  void _sendMessage() {
    if (messageController.text.isNotEmpty) {
      final messageText = messageController.text;

      setState(() {
        messages.add(ChatMessage(
          id: messages.length,
          senderId: '1002',
          receiptId: '303',
          message: messageText,
          read: false,
          chatId: 1,
          createdDate: DateTime.now().toIso8601String(),
          senderName: 'David Mai',
          receiptName: 'Admin',
          status: 'SENDER',
        ));
        messageController.clear();
      });

      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );

    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with admin'),
      ),
      body: Column(
        children: <Widget>[
          
          _buildMessageInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage message, ImageProvider? avatar) {
    bool isSender = message.status == 'SENDER';
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          if (!isSender) // Avatar của người nhận
            CircleAvatar(
              child: Icon(Icons.person),
              backgroundColor: Colors.grey.shade500,
            ),
          if (!isSender) // Thêm khoảng cách giữa avatar và tin nhắn
            SizedBox(width: 8.0),
          Container(
            decoration: BoxDecoration(
              color: isSender ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(12.0),
            child: Text(
              message.message,
              style: TextStyle(color: Colors.white),
            ),
          ),
          if (isSender) // Thêm khoảng cách giữa tin nhắn và avatar
            SizedBox(width: 8.0),
          if (isSender) // Avatar của người gửi
            CircleAvatar(
              backgroundImage: avatar,
              backgroundColor: Colors.grey,
            ),
        ],
      ),
    );
  }

  Widget _buildMessageInputArea() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Enter your message...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final int id;
  final String senderId;
  final String receiptId;
  final String message;
  final bool read;
  final int chatId;
  final String createdDate;
  final String senderName;
  final String receiptName;
  final String status;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.receiptId,
    required this.message,
    required this.read,
    required this.chatId,
    required this.createdDate,
    required this.senderName,
    required this.receiptName,
    required this.status,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderId: json['senderId'],
      receiptId: json['receiptId'],
      message: json['message'],
      read: json['read'],
      chatId: json['chatId'],
      createdDate: json['createdDate'],
      senderName: json['senderName'] ?? '',
      receiptName: json['receiptName'] ?? '',
      status: json['status'],
    );
  }
}
