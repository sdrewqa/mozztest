import 'package:flutter/material.dart';
import 'package:mozztest/features/chat/presentation/providers/dummy_data.dart';

class ChatsProvider extends ChangeNotifier {
  List<ChatViewModel> userChats = ChatData.data.map((json) {
    return ChatViewModel.fromJson(json);
  }).toList();
}

// MODELS
class ChatModel {
  final int chatId;
  final List<MessageModel> messages;

  ChatModel({required this.chatId, required this.messages});
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    List<MessageModel> messages = <MessageModel>[];
    for (var messageJson in json['messages']) {
      messages.add(MessageModel.fromJson(messageJson));
    }
    return ChatModel(
      chatId: json['chatId'],
      messages: messages,
    );
  }
}

class ChatViewModel {
  final String userName;
  final String avatarUrl;
  final MessageModel lastMessage;
  final String lastActiveTime;
  final AvatarPlaceholderModel avatarPlaceholder;
  final int chatId;

  ChatViewModel({
    required this.userName,
    required this.avatarUrl,
    required this.lastMessage,
    required this.lastActiveTime,
    required this.avatarPlaceholder,
    required this.chatId,
  });

  factory ChatViewModel.fromJson(Map<String, dynamic> json) {
    return ChatViewModel(
      userName: json['userName'],
      avatarUrl: json['avatarUrl'],
      lastMessage: MessageModel.fromJson(json['lastMessage']),
      lastActiveTime: json['lastTimeActive'],
      avatarPlaceholder: AvatarPlaceholderModel(
        initials: AvatarPlaceholderModel._getInitials(json['userName']),
        gradientColorsToBack:
            AvatarPlaceholderModel._generateGradientColors(json['userName']),
      ),
      chatId: json['chatId'],
    );
  }
}

class AvatarPlaceholderModel {
  final String initials;
  final List<Color> gradientColorsToBack;
  static String _getInitials(String fullName) {
    List<String> nameSplit = fullName.split(" ");
    String initials = "";
    for (var name in nameSplit) {
      if (name.isNotEmpty) {
        initials += name[0].toUpperCase();
      }
    }
    return initials;
  }

  static List<Color> _generateGradientColors(String text) {
    final int hash = text.hashCode;
    final int r = (hash & 0xFF0000) >> 16;
    final int g = (hash & 0x00FF00) >> 8;
    final int b = hash & 0x0000FF;
    int brightenColorComponent(int component, int factor) {
      return (component + factor).clamp(0, 255);
    }

    const int brightenFactor = 100;
    final Color color1 = Color.fromARGB(
        255,
        brightenColorComponent(r, brightenFactor),
        brightenColorComponent(g, brightenFactor),
        brightenColorComponent(b, brightenFactor));
    final Color color2 = Color.fromARGB(
        255,
        brightenColorComponent(r ~/ 2, brightenFactor),
        brightenColorComponent(g ~/ 2, brightenFactor),
        brightenColorComponent(b ~/ 2, brightenFactor));

    return [color1, color2];
  }

  AvatarPlaceholderModel(
      {required this.initials, required this.gradientColorsToBack});
}

class MessageModel {
  final String message;
  final bool isMe;
  final String timestamp;
  final bool read;
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['text'],
      isMe: json['isMe'],
      timestamp: json['timestamp'],
      read: json['read'],
    );
  }

  MessageModel({
    required this.message,
    required this.isMe,
    required this.timestamp,
    required this.read,
  });
}
