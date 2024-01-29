import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chats_provider.dart';
import 'dummy_data.dart';

class ChatProvider extends ChangeNotifier {
  List<ChatModel> chats =
      ChatData.chats.map((json) => ChatModel.fromJson(json)).toList();

  ChatModel? binarySearchChats(int id) {
    int low = 0;
    int high = chats.length - 1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;
      int midId = chats[mid].chatId;

      if (midId == id) {
        return chats[mid];
      } else if (midId < id) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }
    return null;
  }

  dynamic getTimeStamp(int index, List messages, timeStamp) {
    var today = DateTime.now();
    if (index < messages.length - 1) {
      if (DateFormat('yyyy-MM-dd')
              .format(DateTime.parse(messages[index].timestamp)) !=
          DateFormat('yyyy-MM-dd')
              .format(DateTime.parse(messages[index + 1].timestamp))) {
        timeStamp = DateFormat('yyyy.MM.dd')
            .format(DateTime.parse(messages[index].timestamp));
        if (timeStamp == DateFormat('yyyy.MM.dd').format(today)) {
          return timeStamp = 'Сегодня';
        }
        if (timeStamp ==
            DateFormat('yyyy.MM.dd')
                .format(today.subtract(const Duration(days: 1)))) {
          return timeStamp = 'Вчера';
        }
        return timeStamp;
      }
    } else {
      return timeStamp = DateFormat('yyyy.MM.dd')
          .format(DateTime.parse(messages[index].timestamp));
    }
  }

  late ChatModel chat;
  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController();

  void onMessageSubmit() {
    MessageModel model = MessageModel(
        timestamp: DateTime.now().toString(),
        message: controller.text.toString(),
        isMe: true,
        read: false);
    chat.messages.insert(0, model);
    controller.clear();
    notifyListeners();
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }
}
