// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return ChatMessage(
    uuid: json['uuid'] as String? ?? '',
    senderName: json['sender_name'] as String? ?? '',
    message: json['message'] as String? ?? '',
  );
}

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'sender_name': instance.senderName,
      'message': instance.message,
    };
