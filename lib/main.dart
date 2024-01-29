import 'package:flutter/material.dart';
import 'package:mozztest/features/chat/presentation/providers/chats_provider.dart';
import 'package:provider/provider.dart';

import 'features/chat/presentation/pages/chats_screen.dart';
import 'features/chat/presentation/providers/chat_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChatsProvider()),
          ChangeNotifierProvider(create: (_) => ChatProvider()),
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'Mozz Chat',
            theme: ThemeData(
              fontFamily: 'Gilroy',
              primarySwatch: Colors.blue,
            ),
            home: const ChatsPage(),
          );
        });
  }
}
