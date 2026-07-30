import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';

typedef ClientMoreState = Async<void>;

@Injectable()
class ClientMoreCubit extends Cubit<ClientMoreState> with SafeEmitMixin {
  ClientMoreCubit() : super(const Async.initial());
}
