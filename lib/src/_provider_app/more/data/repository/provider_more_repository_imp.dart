import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';

import '../../../../common/data/models/users/api_provider_model.dart';
import '../../../../common/domain/entity/users/provider_entity.dart';
import '../../domain/repository/provider_more_repository.dart';
import '../../domain/use_cases/update_provider_profile_use_case.dart';

@Injectable(as: ProviderMoreRepository)
class ProviderMoreRepositoryImp implements ProviderMoreRepository {
  final DioHelper _apiHelper;
  final SecureStorageRepository _secureStorage;

  const ProviderMoreRepositoryImp(this._apiHelper, this._secureStorage);

  @override
  DomainServiceType<ProviderEntity> getUserData() async {
    return await failureCollect<ProviderEntity>(() async {
      final result = await _apiHelper.get(url: ApiConstants.addToApiUrlPath("auth/profile"));
      final data = ApiProviderModel.fromJson(result['data']);
      return Right(data.map);
    });
  }

  @override
  DomainServiceType<ProviderEntity> updateUserData(UpdateProviderProfileParams params) async {
    return await failureCollect<ProviderEntity>(() async {
      final result = await _apiHelper.post(url: ApiConstants.addToApiUrlPath("auth/update-profile"), body: params.toMap);
      final ProviderEntity data = ApiProviderModel.fromJson(List.from(result['data']).firstOrNull).map;
      await _secureStorage.setCachedUser(data.mapToCacheEntity);
      return Right(data);
    });
  }
}
