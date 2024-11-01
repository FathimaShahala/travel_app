import 'package:flutter/material.dart';

void main() => runApp(ChatBotApp());

class ChatBotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple AI Bot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatBotScreen(),
    );
  }
}

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage(String message) {
    if (message.trim().isNotEmpty) {
      setState(() {
        _messages.insert(0, {'sender': 'user', 'text': message});
        _controller.clear();
      });
      _generateBotResponse(message);
    }
  }

  void _generateBotResponse(String message) {
    String botResponse;
    
    if (message.contains("hello")) {
      botResponse = "Hello! How can I assist you today?";
    } else if (message.contains("how are you")) {
      botResponse = "I'm just a bot, but I'm here to help!";
    } else if (message.contains("bye")) {
      botResponse = "Goodbye! Feel free to come back anytime.";
    } else {
      botResponse = "I'm sorry, I didn't understand that.";
    }

    setState(() {
      _messages.insert(0, {'sender': 'bot', 'text': botResponse});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Chat Bot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: _messages[index]['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      decoration: BoxDecoration(
                        color: _messages[index]['sender'] == 'user'
                            ? Colors.blue[100]
                            : Colors.green[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _messages[index]['text'] ?? '',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ask something...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
