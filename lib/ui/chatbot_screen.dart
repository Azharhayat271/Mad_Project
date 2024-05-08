import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];

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
        return answer;
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
        title: const Text("Chatbot"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _buildMessage(_messages[index]),
            ),
          ),
          Divider(height: 1.0, color: Colors.grey[300]),
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isUserMessage) _buildBotAvatar(),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: isUserMessage
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              if (!isUserMessage) _buildBotLabel(),
              if (isUserMessage) _buildUserAvatar(),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: EdgeInsets.only(
                    top: 5.0,
                    right: isUserMessage ? 0.0 : 60.0,
                    left: isUserMessage ? 60.0 : 0.0),
                decoration: BoxDecoration(
                  color: isUserMessage ? Colors.blue[100] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2), blurRadius: 3.0),
                  ],
                ),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserAvatar() {
    return CircleAvatar(
      radius: 15.0,
      backgroundColor: Colors.blue[100],
      child: const Icon(
        Icons.person,
        color: Colors.white,
      ),
    );
  }

  Widget _buildBotAvatar() {
    return CircleAvatar(
      radius: 15.0,
      backgroundColor: Colors.green[100],
      child: const Icon(Icons.android, color: Colors.white, size: 20.0),
    );
  }

  Widget _buildBotLabel() {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.android, size: 14.0, color: Colors.green),
          SizedBox(width: 3.0),
          Text(
            "UET-Bot",
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          border:
              Border.all(color: Color.fromARGB(255, 106, 105, 105), width: 1.0),
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(
                  hintText: "Message",
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontFamily: 'Roboto'),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_upward_outlined),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}
