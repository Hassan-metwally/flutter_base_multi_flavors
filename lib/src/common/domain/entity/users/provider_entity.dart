import '../../../../../core/core.dart';
import '../../../../authentication/domain/entities/user_entity.dart';
import '../../enums/provider_status_enum.dart';

class ProviderEntity extends UserEntity {
  final bool isActive;

  const ProviderEntity({
    required super.id,
    required super.name,
    required super.mobile,
    required super.avatar,
    required super.isVerified,
    required this.isActive,
    required super.providerStatus,
  });

  const ProviderEntity.initial()
    : this(
        id: 0,
        name: '',
        mobile: '',
        avatar: const AttachmentEntity.empty(),
        isVerified: false,
        isActive: false,
        providerStatus: ProviderStatusEnum.closed,
      );

  @override
  ProviderEntity copyWith({
    int? id,
    String? name,
    String? mobile,
    AttachmentEntity? avatar,
    bool? isVerified,
    bool? isActive,
    ProviderStatusEnum? providerStatus,
  }) {
    return ProviderEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      avatar: avatar ?? this.avatar,
      isVerified: isVerified ?? this.isVerified,
      isActive: isActive ?? this.isActive,
      providerStatus: providerStatus ?? this.providerStatus,
    );
  }

  @override
  List<Object?> get props => super.props..add(isActive);
}
