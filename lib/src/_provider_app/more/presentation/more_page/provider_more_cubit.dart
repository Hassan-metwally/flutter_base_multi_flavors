import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/di/di.dart';

typedef ProviderMoreState = Async<void>;

@kInjectableProviderEnvironment
@Injectable()
class ProviderMoreCubit extends Cubit<ProviderMoreState> with SafeEmitMixin {
  ProviderMoreCubit() : super(const Async.initial());
}
