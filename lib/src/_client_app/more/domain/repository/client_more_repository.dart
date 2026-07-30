import '../../../../../core/core.dart';
import '../../../../common/domain/entity/users/client_entity.dart';
import '../use_cases/update_client_profile_use_case.dart';

abstract class ClientMoreRepository {
  DomainServiceType<ClientEntity> getClientData();
  DomainServiceType<ClientEntity> updateClientData(UpdateClientProfileParams params);
}
