import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../common/domain/entity/users/provider_entity.dart';
import '../repository/provider_more_repository.dart';

@Injectable()
class GetProviderProfileUseCase extends IUseCase<ProviderEntity, NoParams> {
  final ProviderMoreRepository _repository;

  GetProviderProfileUseCase(this._repository);
  @override
  Future<Either<Failure, ProviderEntity>> call(NoParams params) async {
    return await _repository.getUserData();
  }
}
