part of 'provider_personal_profile_cubit.dart';

class ProviderPersonalProfileState extends Equatable {
  final Async<ProviderEntity> getDataState;
  final Async<void> updateDataState;

  const ProviderPersonalProfileState({required this.getDataState, required this.updateDataState});

  const ProviderPersonalProfileState.initial() : this(getDataState: const Async.initial(), updateDataState: const Async.initial());
  ProviderPersonalProfileState copyWith({final Async<ProviderEntity>? getDataState, final Async<void>? updateDataState}) {
    return ProviderPersonalProfileState(
      getDataState: getDataState ?? this.getDataState,
      updateDataState: updateDataState ?? this.updateDataState,
    );
  }

  @override
  List<Object?> get props => [getDataState, updateDataState];
}
