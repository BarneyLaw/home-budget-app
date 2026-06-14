import 'budget_transaction.dart';

abstract interface class TransactionRepository {
  Stream<List<BudgetTransaction>> watchTransactions();

  Future<void> saveTransaction(BudgetTransaction transaction);

  Future<void> updateTransaction(BudgetTransaction transaction);

  Future<BudgetTransaction?> findLikelyDuplicate({
    required BudgetTransaction candidate,
    required Duration window,
  });
}
