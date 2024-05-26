import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme_helper.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [];
  late OpenAI openAI;

  @override
  void initState() {
    super.initState();
    openAI = OpenAI.instance.build(
      token: 'sk-proj-Elsgj715Gngc6TQvVWouT3BlbkFJDyfBjIzVpkPVbPSotwVZ',
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      enableLog: true,
    );
  }

  void sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'text': text, 'isUser': true});
      });
      fetchResponse(text);
      _controller.clear();
    }
  }

  void fetchResponse(String prompt) async {
    try {
      final request = ChatCompleteText(
        messages: [
          {
            "role": "system",
            "content": [
              {
                "type": "text",
                "text": "I need to be able to write my expenses to you in text, and you should identify three variables within them:\n\nType of expense (taxi, food, etc.)\nAmount\nSphere of life\n\nIf any of the variables are missing, then leave it empty.\n\nThe spheres of life can only be from this list:\nBasic needs\nPhysical health\nLearning\nCareer\nSocial life\nFamily\nMental health\nJoy\n\nThe answer must be in json"
              }
            ]
          },
          {
            "role": "assistant",
            "content": [
              {
                "type": "text",
                "text": "Here's an example of how you can write your expenses:\n\n\"Taxi - \$20 - Leisure\" \n\nJust write your expenses like that and I will do the rest!"
              }
            ]
          },
          {
            "role": "user",
            "content": [
              {
                "type": "text",
                "text": prompt
              }
            ]
          },
        ],
        maxToken: 200,
        model: Gpt4ChatModel(),
      );

      final response = await openAI.onChatCompletion(request: request);

      if (response != null && response.choices.isNotEmpty) {
        setState(() {
          messages.add({'text': response.choices.first.message?.content ?? "No response", 'isUser': false});
        });
      }
    } catch (e) {
      setState(() {
        messages.add({'text': 'Error getting response from GPT-4.', 'isUser': false});
      });
      print('Error getting response from GPT-4: $e');
    }
  }

  void gptFunctionCalling() async {
    final request = ChatCompleteText(
      messages: [
        {
          "role": "user",
          "content": "What is the weather like in Boston?",
          "name": "get_current_weather",
        },
      ],
      maxToken: 200,
      model: Gpt41106PreviewChatModel(),
      tools: [
        {
          "type": "function",
          "function": {
            "name": "get_current_weather",
            "description": "Get the current weather in a given location",
            "parameters": {
              "type": "object",
              "properties": {
                "location": {
                  "type": "string",
                  "description": "The city and state, e.g. San Francisco, CA"
                },
                "unit": {
                  "type": "string",
                  "enum": ["celsius", "fahrenheit"]
                }
              },
              "required": ["location"]
            }
          }
        }
      ],
      toolChoice: 'auto',
    );

    try {
      final response = await openAI.onChatCompletion(request: request);
      if (response != null && response.choices.isNotEmpty) {
        setState(() {
          messages.add({
            'text': response.choices.first.message?.content ?? "No response",
            'isUser': false
          });
        });
      }
    } catch (e) {
      setState(() {
        messages.add({'text': 'Error processing request.', 'isUser': false});
      });
      print('Error processing request: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Align(
                    alignment: message['isUser'] ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      color: message['isUser'] ? Colors.blue : Colors.grey[500],
                      child: Text(message['text'], style: TextStyle(
                        color: Colors.white
                      ),),
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
                  child: Expanded(
                    child: SearchTextField(fieldValue: (String value) {
                      
                    }, controller: _controller,),
                  )
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xffA8A8A8),),
                  onPressed: () => sendMessage(_controller.text.trim()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.fieldValue,
    required this.controller
  });

  final ValueChanged<String> fieldValue;
  final TextEditingController controller;
  
  
  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: controller,
      backgroundColor: const Color(0x19F6F6F6),
      prefixIcon: Icon(Icons.abc_outlined),
      placeholder: 'Message',
      style: TextStyle(
        color: Colors.white
      ),
      onChanged: (String value) {
        fieldValue('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        fieldValue('Submitted text: $value');
      },
    );
  }
}