import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../material/media/app_image.dart';
import '../../data/models/api_message_author.dart';
import 'message_auther.dart';

sealed class IChatDetailsEntity extends Equatable {
  final int id;
  final MessageAuthor currentUser;
  final MessageAuthor otherUser;
  // final bool isClosed;

  const IChatDetailsEntity({
    required this.id,
    required this.currentUser,
    required this.otherUser,
    // required this.isClosed
  });

  factory IChatDetailsEntity.fromJson(Map<String, dynamic> json) {
    final String type = json['user_type'];
    switch (type) {
      case RepresentativeChatDetailsEntity.typeValue:
        return RepresentativeChatDetailsEntity.fromJson(json);
      case ClientChatDetailsEntity.typeValue:
      default:
        return ClientChatDetailsEntity.fromJson(json);
    }
  }

  Widget get getTitleWidget => const SizedBox.shrink();

  @override
  List<Object?> get props => [
    id, currentUser, otherUser,
    // isClosed
  ];
}

class ClientChatDetailsEntity extends IChatDetailsEntity {
  const ClientChatDetailsEntity({
    required super.id,
    required super.currentUser,
    required super.otherUser,
    // required super.isClosed,
  });

  static const String typeValue = "client";

  factory ClientChatDetailsEntity.fromJson(Map<String, dynamic> json) {
    return ClientChatDetailsEntity(
      id: json["chat_id"],
      currentUser: ApiMessageAuthor.fromJson(json["sender"]['user']).map,
      otherUser: ApiMessageAuthor.fromJson(json["receiver"]['user']).map,
      // isClosed: json["status"] != "enabled",
    );
  }

  @override
  Widget get getTitleWidget {
    return Row(
      children: [
        AppImage.circle(dimension: 40, path: otherUser.avatar),
        const SizedBox(width: 8),
        Text(otherUser.name, style: TextStyles.regular14),
      ],
    );
  }

  @override
  List<Object?> get props => [...super.props];
}

class RepresentativeChatDetailsEntity extends IChatDetailsEntity {
  const RepresentativeChatDetailsEntity({
    required super.id,
    required super.currentUser,
    required super.otherUser,
    // required super.isClosed
  });

  static const String typeValue = "rep";

  factory RepresentativeChatDetailsEntity.fromJson(Map<String, dynamic> json) {
    return RepresentativeChatDetailsEntity(
      id: json["chat_id"],
      currentUser: ApiMessageAuthor.fromJson(json["sender"]['user'] ?? {}).map,
      otherUser: ApiMessageAuthor.fromJson(json["receiver"]['user'] ?? {}).map,
      // isClosed: json["status"] != "enabled",
    );
  }

  @override
  Widget get getTitleWidget {
    return Row(
      children: [
        AppImage.circle(dimension: 40, path: otherUser.avatar),
        const SizedBox(width: 8),
        Text(otherUser.name, style: TextStyles.regular14),
      ],
    );
  }

  @override
  List<Object?> get props => [...super.props];
}
