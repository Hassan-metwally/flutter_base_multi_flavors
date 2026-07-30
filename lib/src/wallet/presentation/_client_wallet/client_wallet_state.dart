part of 'client_wallet_cubit.dart';

class ClientWalletState extends Equatable {
  final Async<BalanceEntity> getBalanceState;
  final Async<void> withDrawState;
  final Async<List<TransactionEntity>> getWalletHistoryState;
  final int currentPage;
  final int lastPage;

  const ClientWalletState({
    required this.getBalanceState,
    required this.withDrawState,
    required this.getWalletHistoryState,
    required this.currentPage,
    required this.lastPage,
  });

  const ClientWalletState.initial()
    : this(
        getBalanceState: const Async.initial(),
        withDrawState: const Async.initial(),
        getWalletHistoryState: const Async.initial(),
        currentPage: 1,
        lastPage: 1,
      );

  ClientWalletState copyWith({
    final Async<BalanceEntity>? getBalanceState,
    final Async<String>? withDrawState,
    final Async<List<TransactionEntity>>? getWalletHistoryState,
    final int? currentPage,
    final int? lastPage,
  }) => ClientWalletState(
    getBalanceState: getBalanceState ?? this.getBalanceState,
    getWalletHistoryState: getWalletHistoryState ?? this.getWalletHistoryState,
    withDrawState: withDrawState ?? this.withDrawState,
    currentPage: currentPage ?? this.currentPage,
    lastPage: lastPage ?? this.lastPage,
  );

  @override
  List<Object?> get props => [getBalanceState, getWalletHistoryState, withDrawState, currentPage, lastPage];
}
