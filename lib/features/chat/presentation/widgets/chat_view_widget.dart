import 'package:flutter/material.dart';
import 'package:mozztest/features/chat/presentation/providers/chats_provider.dart';

class ChatViewWidget extends StatelessWidget {
  const ChatViewWidget(
      {super.key, required this.chat, required this.isChatsScreen});
  final ChatViewModel chat;
  final bool isChatsScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isChatsScreen ? 70 : 50,
      decoration: isChatsScreen
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(237, 242, 246, 1),
                  width: 1,
                ),
              ),
            )
          : null,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            chat.avatarUrl == ''
                ? Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: chat.avatarPlaceholder.gradientColorsToBack,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: FittedBox(
                      child: Center(
                        child: Text(
                          chat.avatarPlaceholder.initials,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(chat.avatarUrl),
                  ),
            const SizedBox(
              width: 12,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chat.userName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  isChatsScreen
                      ? Row(
                          children: [
                            chat.lastMessage.isMe
                                ? const Text('Вы: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ))
                                : const SizedBox(),
                            Text(chat.lastMessage.message,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color.fromRGBO(94, 122, 144, 1)))
                          ],
                        )
                      : const Text('В сети',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromRGBO(94, 122, 144, 1)))
                ]),
            const Spacer(),
            isChatsScreen
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(chat.lastActiveTime,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color.fromRGBO(94, 122, 144, 1))),
                  )
                : const SizedBox()
          ]),
    );
  }
}
