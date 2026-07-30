import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../common/domain/entity/common_entity.dart';
import '../../../notifications/helpers/firebase/firebase_helper.dart';
import '../repository/authentication_repository.dart';

@Injectable()
class UserRegisterUseCase extends IUseCase<void, UserRegisterParams> {
  final AuthenticationRepository _repository;

  UserRegisterUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(UserRegisterParams params) async {
    return await _repository.userRegister(params);
  }
}

class UserRegisterParams extends Equatable {
  final String name;
  final String phone;
  final CommonEntity city;

  const UserRegisterParams({required this.phone, required this.name, required this.city});

  Future<Map<String, dynamic>> get toMap async {
    return {
      "name": name,
      "mobile": (phone.isNotEmpty && !phone.startsWith('0')) ? '0$phone' : phone,
      "city_id": city.id,
      "device_token": await FirebaseHelper.getDeviceFcmToken(),
      "terms": 1,
    };
  }

  @override
  List<Object?> get props => [phone, name, city];
}
