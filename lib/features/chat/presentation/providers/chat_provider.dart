import 'package:flutter/material.dart';
import 'package:mozztest/features/chat/presentation/providers/local_data.dart';

class ChatProvider extends ChangeNotifier {
  List<ChatViewModel> userChats =
      ChatData.data.map((json) => ChatViewModel.fromJson(json)).toList();
}




// MODELS
class ChatViewModel {
  final String userName;
  final String avatarUrl;
  final MessageModel lastMessage;
  final String lastActiveTime;
  final AvatarPlaceholderModel avatarPlaceholder;

  ChatViewModel(
      {required this.userName,
      required this.avatarUrl,
      required this.lastMessage,
      required this.lastActiveTime,
      required this.avatarPlaceholder});

  factory ChatViewModel.fromJson(Map<String, dynamic> json) {
    return ChatViewModel(
      userName: json['userName'],
      avatarUrl: json['avatarUrl'],
      lastMessage: MessageModel.fromJson(json['lastMessage']),
      lastActiveTime: json['lastActiveTime'],
      avatarPlaceholder: AvatarPlaceholderModel(
        initials: AvatarPlaceholderModel._getInitials(json['userName']),
        gradientColorsToBack:
            AvatarPlaceholderModel._generateGradientColors(json['userName']),
      ),
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
    int _brightenColorComponent(int component, int factor) {
      return (component + factor).clamp(0, 255);
    }

    final int brightenFactor = 100;
    final Color color1 = Color.fromARGB(
        255,
        _brightenColorComponent(r, brightenFactor),
        _brightenColorComponent(g, brightenFactor),
        _brightenColorComponent(b, brightenFactor));
    final Color color2 = Color.fromARGB(
        255,
        _brightenColorComponent(r ~/ 2, brightenFactor),
        _brightenColorComponent(g ~/ 2, brightenFactor),
        _brightenColorComponent(b ~/ 2, brightenFactor));

    return [color1, color2];
  }

  AvatarPlaceholderModel(
      {required this.initials, required this.gradientColorsToBack});
}

class MessageModel {
  final String message;
  final bool isMe;
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      isMe: json['isMe'],
    );
  }

  MessageModel({required this.message, required this.isMe});
}
