import 'package:bloc/bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/di/di.dart';
import '../../domain/use_case/_client_register_use_case.dart';

typedef UserRegisterState = Async<void>;

class UserRegisterCubit extends Cubit<UserRegisterState> with SafeEmitMixin {
  UserRegisterCubit() : super(const Async.initial());

  final UserRegisterUseCase _registerUseCase = injector();

  void register(UserRegisterParams params) async {
    emit(const Async.loading());
    final result = await _registerUseCase(params);
    result.fold(
      (failure) {
        emit(Async.failure(failure));
      },
      (_) {
        emit(const Async.successWithoutData());
      },
    );
    emit(const Async.initial());
  }
}
