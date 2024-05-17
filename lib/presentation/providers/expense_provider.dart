import 'dart:developer';

import 'package:expense_tracker/data/data_source/objectbox/object_box.dart';
import 'package:expense_tracker/data/model/transaction_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_provider.g.dart';

@riverpod
class Expense extends _$Expense {
  @override
  Future<List<TransactionEntity>> build() async {
    return getExpenses();
  }

  Future<List<TransactionEntity>> getExpenses() async {
    return ObjectBoxImpl().getAllexpense();
  }

  Future<void> addExpenses(
    String category,
    String amount,
    DateTime date,
  ) async {
    if (amount.isNotEmpty || double.tryParse(amount) != null) {
      log(double.tryParse(amount)!.toString());
      ObjectBoxImpl().addExpense(category, double.tryParse(amount)!, date);
    }
  }

  Future<void> deleteExpense(BuildContext context, {required int id}) async {
    ObjectBoxImpl().delete(id);
  }

  Future<void> updateExpenses(BuildContext context, int id, String category,
      double amount, DateTime date) async {
    ObjectBoxImpl().updateExpense(context, id, category, amount, date);
  }
}
