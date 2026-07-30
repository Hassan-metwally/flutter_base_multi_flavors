import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../common/domain/entity/common_entity.dart';
import '../../../notifications/helpers/firebase/firebase_helper.dart';
import '../repository/authentication_repository.dart';

@Injectable()
class ProviderRegisterUseCase extends IUseCase<void, ProviderRegisterParams> {
  final AuthenticationRepository _repository;

  ProviderRegisterUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ProviderRegisterParams params) async {
    return await _repository.providerRegister(params);
  }
}

class ProviderRegisterParams extends Equatable {
  final AttachmentEntity avatar;
  final String name;
  final String phone;
  final CommonEntity city;
  final CommonEntity service;
  final String commercialRegistrationNumber;
  final String address;
  final double lat;
  final double lng;
  final CommonEntity bank;
  final String iban;
  final AttachmentEntity ibanCertificateImage;
  final AttachmentEntity commercialRegisterImage;
  final AttachmentEntity operatingLicenseImage;
  final String operatingLicenseNumber;

  const ProviderRegisterParams({
    required this.avatar,
    required this.phone,
    required this.name,
    required this.city,
    required this.service,
    required this.commercialRegistrationNumber,
    required this.address,
    required this.lat,
    required this.lng,
    required this.bank,
    required this.iban,
    required this.ibanCertificateImage,
    required this.commercialRegisterImage,
    required this.operatingLicenseImage,
    required this.operatingLicenseNumber,
  });

  Future<Map<String, dynamic>> get toMap async {
    return {
      "avatar": MultipartFile.fromFileSync(avatar.path),
      "name": name,
      "mobile": (phone.isNotEmpty && !phone.startsWith('0')) ? '0$phone' : phone,
      "city_id": city.id,
      "service_id": service.id,
      "commercial_register_number": commercialRegistrationNumber,
      'address_title': address,
      'lat': lat,
      'lng': lng,
      "device_token": await FirebaseHelper.getDeviceFcmToken(),
      "terms": 1,
      "bank_id": bank.id,
      "iban": iban,
      "iban_certificate_image": MultipartFile.fromFileSync(ibanCertificateImage.path),
      "commercial_register_image": MultipartFile.fromFileSync(commercialRegisterImage.path),
      "operating_license_image": MultipartFile.fromFileSync(operatingLicenseImage.path),
      "operating_license_number": operatingLicenseNumber,
    };
  }

  @override
  List<Object?> get props => [
    avatar,
    phone,
    name,
    city,
    service,
    commercialRegistrationNumber,
    address,
    lat,
    lng,
    bank,
    iban,
    ibanCertificateImage,
    commercialRegisterImage,
    operatingLicenseImage,
    operatingLicenseNumber,
  ];
}
