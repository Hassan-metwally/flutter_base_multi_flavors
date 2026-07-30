import '../../../../../core/core.dart';
import '../../../../authentication/data/models/api_user_model.dart';
import '../../../domain/entity/users/provider_entity.dart';
import '../../../domain/enums/provider_status_enum.dart';

class ApiProviderModel extends ApiUserModel {
  final bool? isActive;

  ApiProviderModel({
    required super.id,
    required super.name,
    required super.mobile,
    required super.avatar,
    required super.isVerified,
    required this.isActive,
    required super.providerStatus,
  });

  factory ApiProviderModel.fromJson(Map<String, dynamic> json) => ApiProviderModel(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    avatar: json["avatar"] != null ? AttachmentEntity.fromNetwork(url: json["avatar"]) : null,
    isVerified: json["is_verified"],
    isActive: json["is_active"],
    providerStatus: json["provider_status"] != null ? ProviderStatusEnum.fromString(json["provider_status"]) : null,
  );
}

extension ApiProviderModelEXT on ApiProviderModel {
  ProviderEntity get map => ProviderEntity(
    id: id ?? 0,
    name: name ?? '',
    mobile: mobile ?? '',
    avatar: avatar ?? const AttachmentEntity.empty(),
    isVerified: isVerified,
    isActive: isActive ?? false,
    providerStatus: providerStatus ?? ProviderStatusEnum.closed,
  );
}
