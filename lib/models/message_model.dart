import 'package:chat_app_flutter/common/utils/message_enum.dart';

class Message {
  final String senderId;
  final String receiverId;
  final String text;
  final MessageEnum type;
  final DateTime timeSent;
  final String messageId;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.type,
    required this.timeSent,
    required this.messageId,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'type': type.type,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'messageId': messageId,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'] ?? "",
      receiverId: map['receiverId'] ?? "",
      text: map['profilePic'] ?? "",
      type: map['type'] ?? '',
      timeSent: DateTime.fromMicrosecondsSinceEpoch(map['timeSent']),
      messageId: map['messageId'] ?? "",
    );
  }
}
