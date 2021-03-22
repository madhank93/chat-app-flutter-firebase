import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: "uuid", defaultValue: "")
  final String uuid;

  @JsonKey(name: "sender_name", defaultValue: "")
  final String senderName;

  @JsonKey(name: "message", defaultValue: "")
  final String message;

  Message(
      {required this.uuid, required this.senderName, required this.message});

  factory Message.fromJson(Map<String, dynamic> data) =>
      _$MessageFromJson(data);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
