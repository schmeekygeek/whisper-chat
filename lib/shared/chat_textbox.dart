import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatTextBox extends StatelessWidget {
  const ChatTextBox({super.key, required this.channel});

  final WebSocketChannel channel;

  static final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: TextField(
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1,
                  ),
              controller: _controller,
              decoration: const InputDecoration(
                // contentPadding: EdgeInsets.zero,
                hintText: 'Type a message...',
                isDense: false,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color(0xffa7d2cb),
                  ),
                ),
                onPressed: () {
                  String message = _controller.text;
                  _controller.clear();
                  channel.sink.add(message);
                },
                icon: const Icon(
                  Icons.send,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
