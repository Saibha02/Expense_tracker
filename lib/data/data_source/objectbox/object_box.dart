import 'package:expense_tracker/core/store.dart';
import 'package:expense_tracker/data/model/transaction_entity.dart';
import 'package:expense_tracker/domain/repository/expense_repository.dart';
import 'package:expense_tracker/objectbox.g.dart';
import 'package:flutter/widgets.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBoxImpl implements ExpenseRepository {
  late final Store store;

  @override
  Future<void> addExpense(String category, double amount, DateTime date) async {
    Objectbox.instance.expensebox
        .put(TransactionEntity(category: category, amount: amount, date: date));
  }

  @override
  Future<void> delete(int id) async {
    Objectbox.instance.expensebox.remove(id);
  }

  @override
  Future<List<TransactionEntity>> getAllexpense() async {
    return Objectbox.instance.expensebox.getAll();
  }

  @override
  Future<void> updateExpense(BuildContext context, int id, String category,
      double amount, DateTime date) async {
    Objectbox.instance.expensebox
        .put(TransactionEntity(category: category, amount: amount, date: date));
  }

  @override
  Future<Objectbox> createObject() async {
    final instance = Objectbox.create();
    return instance;
  }

  
    }
       
 