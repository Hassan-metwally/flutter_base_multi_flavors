import '../../../../../core/core.dart';
import '../../../../authentication/domain/entities/user_entity.dart';
import '../../enums/provider_status_enum.dart';

class ClientEntity extends UserEntity {
  const ClientEntity({required super.id, required super.name, required super.mobile, required super.avatar, required super.isVerified});

  const ClientEntity.initial() : this(id: 0, name: '', mobile: '', avatar: const AttachmentEntity.empty(), isVerified: false);

  @override
  ClientEntity copyWith({
    int? id,
    String? name,
    String? mobile,
    AttachmentEntity? avatar,
    bool? isVerified,
    bool? isActive,
    ProviderStatusEnum? providerStatus,
  }) {
    return ClientEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      avatar: avatar ?? this.avatar,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
