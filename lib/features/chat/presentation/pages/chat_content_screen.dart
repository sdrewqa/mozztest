import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mozztest/features/chat/presentation/providers/chat_provider.dart';
import 'package:mozztest/features/chat/presentation/providers/chats_provider.dart';
import 'package:mozztest/features/chat/presentation/widgets/chat_message_widget.dart';
import 'package:provider/provider.dart';
import '../widgets/chat_appbar_widget.dart';

class ChatContentPage extends StatefulWidget {
  const ChatContentPage(
      {super.key, required this.chat, required this.indexChat});
  final ChatViewModel chat;
  final int indexChat;

  @override
  State<ChatContentPage> createState() => _ChatContentPageState();
}

class _ChatContentPageState extends State<ChatContentPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ChatProvider>(context, listen: false).chat =
        Provider.of<ChatProvider>(context, listen: false)
            .binarySearchChats(widget.indexChat)!;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ChatAppBarWidget(
            chat: widget.chat,
          ),
          Container(
            width: double.infinity,
            height: 12,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(237, 242, 246, 1),
                  width: 1,
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            controller: provider.scrollController,
            reverse: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 38),
            itemBuilder: (context, index) {
              var timeStamp = Provider.of<ChatProvider>(context, listen: false)
                  .getTimeStamp(index, provider.chat.messages, this);
              return ChatMessageWidget(
                timeStamp: timeStamp,
                chatMessages: provider.chat.messages[index],
              );
            },
            itemCount: provider.chat.messages.length,
          )),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(237, 242, 246, 1),
                  width: 1,
                ),
              ),
            ),
            height: 74,
            padding: const EdgeInsets.only(top: 14, left: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 55,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildIconButton('assets/icons/Attach.svg'),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 42,
                        child: TextFormField(
                          controller:
                              Provider.of<ChatProvider>(context, listen: true)
                                  .controller,
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          minLines: 1,
                          autocorrect: false,
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () {
                            Provider.of<ChatProvider>(context, listen: false)
                                .onMessageSubmit();
                          },
                          decoration: const InputDecoration(
                              hintText: 'Сообщение',
                              filled: true,
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(157, 183, 203, 1)),
                              fillColor: Color.fromRGBO(237, 242, 246, 1),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildIconButton('assets/icons/Audio.svg')
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  _buildIconButton(String asset) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          width: 42,
          height: 42,
          padding: const EdgeInsets.all(9),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(237, 242, 246, 1),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: SvgPicture.asset(asset),
        ));
  }
}
