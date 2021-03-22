// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    uuid: json['uuid'] as String? ?? '',
    senderName: json['sender_name'] as String? ?? '',
    message: json['message'] as String? ?? '',
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'sender_name': instance.senderName,
      'message': instance.message,
    };
