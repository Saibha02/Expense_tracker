// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseHash() => r'c447249e91646b2da936cc60daa644b4c05cc015';

/// See also [Expense].
@ProviderFor(Expense)
final expenseProvider =
    AutoDisposeAsyncNotifierProvider<Expense, List<TransactionEntity>>.internal(
  Expense.new,
  name: r'expenseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$expenseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Expense = AutoDisposeAsyncNotifier<List<TransactionEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
