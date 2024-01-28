import 'package:flutter/material.dart';

class ChatViewWidget extends StatelessWidget {
  const ChatViewWidget({super.key, required this.chat, required this.index});
  final List chat;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(237, 242, 246, 1),
            width: 1,
          ),
        ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            chat[index].avatarUrl == ''
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors:
                            chat[index].avatarPlaceholder.gradientColorsToBack,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        chat[index].avatarPlaceholder.initials,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(chat[index].avatarUrl),
                  ),
            const SizedBox(
              width: 12,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chat[index].userName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  Row(
                    children: [
                      chat[index].lastMessage.isMe
                          ? const Text('Вы: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ))
                          : const SizedBox(),
                      Text(chat[index].lastMessage.message,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromRGBO(94, 122, 144, 1)))
                    ],
                  )
                ]),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(chat[index].lastActiveTime,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color.fromRGBO(94, 122, 144, 1))),
            ),
          ]),
    );
  }
}
