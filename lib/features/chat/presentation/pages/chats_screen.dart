import 'package:flutter/material.dart';
import 'package:mozztest/features/chat/presentation/providers/chats_provider.dart';
import 'package:mozztest/features/chat/presentation/widgets/chat_view_widget.dart';
import 'package:provider/provider.dart';
import 'chat_content_screen.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 14, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Чаты',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 42,
                      child: TextField(
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        decoration: InputDecoration(
                            hintText: 'Поиск',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(157, 183, 203, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            prefixIcon: Image.asset(
                              'assets/icons/search.png',
                              scale: 2,
                            ),
                            contentPadding: const EdgeInsets.only(
                                top: 11.5, left: 10, right: 10),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            filled: true,
                            fillColor: const Color.fromRGBO(237, 242, 246, 1)),
                      ),
                    ),
                  ],
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: const Color.fromRGBO(237, 242, 246, 1),
            ),
            Consumer<ChatsProvider>(builder: (context, chatProvider, child) {
              if (chatProvider.userChats.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatContentPage(
                                chat: chatProvider.userChats[index],
                                indexChat: index,
                              ),
                            ),
                          );
                        },
                        child: ChatViewWidget(
                          chat: chatProvider.userChats[index],
                          isChatsScreen: true,
                        ),
                      );
                    },
                    itemCount: chatProvider.userChats.length,
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
