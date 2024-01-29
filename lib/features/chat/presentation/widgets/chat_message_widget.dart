import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mozztest/features/chat/presentation/providers/chats_provider.dart';
import 'chat_time_stamp_widget.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key, this.timeStamp, required this.chatMessages});
  final dynamic timeStamp;
  final MessageModel chatMessages;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (timeStamp != null)
          ChatTimeStampWidget(
            timeStamp: timeStamp,
          ),
        Row(
          mainAxisAlignment: chatMessages.isMe
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!chatMessages.isMe)
              SvgPicture.asset(
                'assets/icons/Vector.svg',
              ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 12),
              margin: const EdgeInsets.only(top: 20),
              constraints: const BoxConstraints(
                minHeight: 33,
              ),
              decoration: BoxDecoration(
                  color: chatMessages.isMe
                      ? const Color.fromRGBO(60, 237, 120, 1)
                      : const Color.fromRGBO(237, 242, 246, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(chatMessages.isMe ? 16 : 0),
                      bottomRight: Radius.circular(chatMessages.isMe ? 0 : 16),
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: Text(chatMessages.message,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4, left: 7),
                    child: Text(
                      DateFormat('HH:mm')
                          .format(DateTime.parse(chatMessages.timestamp)),
                      style: const TextStyle(
                          color: Color.fromARGB(201, 0, 0, 0),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 4, left: 4),
                      child: chatMessages.isMe
                          ? chatMessages.read
                              ? SvgPicture.asset(
                                  'assets/icons/Read.svg',
                                )
                              : SvgPicture.asset(
                                  'assets/icons/Unread.svg',
                                )
                          : const SizedBox())
                ],
              ),
            ),
            if (chatMessages.isMe) SvgPicture.asset('assets/icons/messVec.svg')
          ],
        ),
      ],
    );
  }
}
