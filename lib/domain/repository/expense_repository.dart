import 'package:expense_tracker/core/store.dart';
import 'package:expense_tracker/data/model/transaction_entity.dart';
import 'package:flutter/widgets.dart';

abstract class ExpenseRepository {
  Future<List<TransactionEntity>> getAllexpense();
  Future<void> addExpense(String category, double amount, DateTime date);
  Future<void> updateExpense(BuildContext context, int id, String category,
      double amount, DateTime date);
  Future<void> delete(int id);
  Future<Objectbox> createObject();

}
