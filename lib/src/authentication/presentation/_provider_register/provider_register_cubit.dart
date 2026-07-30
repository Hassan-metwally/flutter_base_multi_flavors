import 'package:bloc/bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/di/di.dart';
import '../../domain/use_case/_provider_register_use_case.dart';

typedef ProviderRegisterState = Async<void>;

class ProviderRegisterCubit extends Cubit<ProviderRegisterState> with SafeEmitMixin {
  ProviderRegisterCubit() : super(const Async.initial());

  final ProviderRegisterUseCase _registerUseCase = injector();

  void register(ProviderRegisterParams params) async {
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
