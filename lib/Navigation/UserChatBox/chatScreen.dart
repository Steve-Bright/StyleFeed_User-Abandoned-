import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(
        personName: 'Winter', // Replace with the person's name
        personProfileImage:
            'assets/pfp/winter.jpg', // Replace with the profile image path
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String personName;
  final String personProfileImage;

  ChatScreen({required this.personName, required this.personProfileImage});

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  File? _imageFile; // Stores the selected image file

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isSentByUser: true, // Set this to true for messages sent by the user
    );
    setState(() {
      _messages.insert(0, message);
      _imageFile = null;
    });
  }

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: _getImage,
          ),
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Add this line to navigate back
          },
        ),
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(widget.personProfileImage),
            ),
            SizedBox(width: 8.0),
            Text(widget.personName),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final File? imageFile;
  final bool isSentByUser; // Indicates whether the message is sent by the user

  ChatMessage({required this.text, this.imageFile, this.isSentByUser = false});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isSentByUser ? Colors.blue : Colors.grey.shade300;
    final BorderRadius borderRadius = isSentByUser
        ? BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(0.0),
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment:
            isSentByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (!isSentByUser)
                CircleAvatar(
                  child: Text('User'),
                ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: borderRadius,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (!isSentByUser)
                        Text('User',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      if (text.isNotEmpty) Text(text),
                      if (imageFile != null) Image.file(imageFile!),
                    ],
                  ),
                ),
              ),
              if (isSentByUser)
                CircleAvatar(
                  child: Text('User'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
