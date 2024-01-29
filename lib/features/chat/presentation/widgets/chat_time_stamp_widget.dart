import 'package:flutter/material.dart';

class ChatTimeStampWidget extends StatelessWidget {
  const ChatTimeStampWidget({super.key, this.timeStamp});
  final dynamic timeStamp;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 17,
        margin: const EdgeInsets.only(top: 20, bottom: 3),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Container(
                height: 2,
                color: const Color.fromRGBO(237, 242, 246, 1),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '$timeStamp',
              style: const TextStyle(
                  height: 1.2,
                  color: Color.fromRGBO(157, 183, 203, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 2,
                color: const Color.fromRGBO(237, 242, 246, 1),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
          ],
        ));
  }
}
