import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../common/domain/entity/users/client_entity.dart';
import '../repository/client_more_repository.dart';

@Injectable()
class UpdateClientProfileUseCase extends IUseCase<ClientEntity, UpdateClientProfileParams> {
  final ClientMoreRepository _repository;

  UpdateClientProfileUseCase(this._repository);
  @override
  Future<Either<Failure, ClientEntity>> call(UpdateClientProfileParams params) async {
    return await _repository.updateClientData(params);
  }
}

class UpdateClientProfileParams {
  final AttachmentEntity? image;
  final String name;

  const UpdateClientProfileParams({required this.image, required this.name});

  Map<String, dynamic> get toMap {
    final MultipartFile? file = image?.path.toMultipartFile;
    return {if (file != null) 'avatar': file, 'name': name, "_method": "put"};
  }
}
