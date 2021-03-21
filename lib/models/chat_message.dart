import 'package:json_annotation/json_annotation.dart';

part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage {
  @JsonKey(name: "uuid", defaultValue: "")
  final String uuid;

  @JsonKey(name: "sender_name", defaultValue: "")
  final String senderName;

  @JsonKey(name: "message", defaultValue: "")
  final String message;

  ChatMessage(
      {required this.uuid, required this.senderName, required this.message});

  factory ChatMessage.fromJson(Map<String, dynamic> data) =>
      _$ChatMessageFromJson(data);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
