import '../../../../core/core.dart';
import '../entities/user_entity.dart';
import '../use_case/_client_register_use_case.dart';
import '../use_case/_provider_register_use_case.dart';
import '../use_case/can_update_phone_use_case.dart';
import '../use_case/login_use_case.dart';
import '../use_case/resend_otp_use_case.dart';
import '../use_case/verify_otp_use_case.dart';

abstract class AuthenticationRepository {
  DomainServiceType<UserEntity> login(LoginParams params);
  DomainServiceType<void> userRegister(UserRegisterParams params);
  DomainServiceType<void> providerRegister(ProviderRegisterParams params);
  DomainServiceType<void> verifyOtp(VerifyOtpParams params);
  DomainServiceType<void> resendOtp(ResendOtpParams params);
  DomainServiceType<void> canUpdateMobile(CanUpdatePhoneParams params);
  DomainServiceType<void> logOut();
  DomainServiceType<void> deleteAccount();
  // DomainServiceType<void> resetPassword(ResetPasswordParams params);
  // DomainServiceType<void> forgotPassword(ForgotPasswordParams params);
  // DomainServiceType<void> updatePassword(UpdatePasswordParams params);
}
