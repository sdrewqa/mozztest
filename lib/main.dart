import 'package:flutter/material.dart';
import 'package:mozztest/features/chat/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

import 'features/chat/presentation/pages/chats_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChatProvider()),
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'Mozz Chat',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: ChatsScreen(),
          );
        });
  }
}
