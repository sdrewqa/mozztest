import 'package:flutter/material.dart';
import 'package:mozztest/features/chat/presentation/providers/chats_provider.dart';
import 'package:mozztest/features/chat/presentation/widgets/chat_view_widget.dart';

class ChatAppBarWidget extends StatelessWidget {
  const ChatAppBarWidget({super.key, required this.chat});
  final ChatViewModel chat;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: MediaQuery.of(context).size.width,
        surfaceTintColor: Colors.transparent,
        leading: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  width: 36,
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 26),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: ChatViewWidget(
                  chat: chat,
                  isChatsScreen: false,
                ),
              )
            ],
          ),
        ));
  }
}
