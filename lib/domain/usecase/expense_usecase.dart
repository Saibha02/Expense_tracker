import 'package:expense_tracker/data/model/transaction_entity.dart';
import 'package:expense_tracker/domain/repository/expense_repository.dart';

class GetExpense {
  late final ExpenseRepository repository;
  GetExpense(this.repository);
  Future<List<TransactionEntity>> call() async {
    return await repository.getAllexpense();
  }
}
