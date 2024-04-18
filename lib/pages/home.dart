import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<String> _messages = [];

  void _handleSubmitted(String text) async {
    _textController.clear();
    String response = await _sendMessage(text);
    setState(() {
      _messages.add(text);
      _messages.add(response);
    });
  }

  Future<String> _sendMessage(String query) async {
    String url = 'https://uet-narowal-chatbot-server.onrender.com/ask';
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonBody = json.encode({"question": query});
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: jsonBody);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        String answer = data['answer'];
        return answer != null
            ? answer
            : "Error: No answer provided by the server";
      } else {
        return "Error: Failed to fetch response";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _buildMessage(_messages[index]),
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String message) {
    final isUserMessage = _messages.indexOf(message) % 2 == 0;

    return ListTile(
      leading:
          isUserMessage ? Icon(Icons.person) : Icon(Icons.chat_bubble_outline),
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isUserMessage ? Colors.blue[100] : Colors.green[100],
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(
            color: isUserMessage ? Colors.blue[900] : Colors.green[900],
          ),
        ),
      ),
      trailing: isUserMessage ? null : Icon(Icons.person),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}
