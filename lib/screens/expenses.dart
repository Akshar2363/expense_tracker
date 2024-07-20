import '../provider/expense_provider.dart';
import '../provider/filters_provider.dart';
import '../widgets/ads/expensesPageAd.dart';
import '../widgets/expenses_list/expenses_list.dart';
import '../models/expense.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpensesTracker extends ConsumerStatefulWidget {
  const ExpensesTracker({super.key});

  @override
  ConsumerState<ExpensesTracker> createState() {
    return _ExpensesTracker();
  }
}

class _ExpensesTracker extends ConsumerState<ExpensesTracker> {
  void _removeExpense(Expense expense) {
    final expenseNotifier = ref.read(expenseProvider.notifier);
    expenseNotifier.removeExpense(expense);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            expenseNotifier.addExpense(expense);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredExpenses = ref.watch(filteredExpensesProvider);
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding them!'),
    );

    if (filteredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: filteredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      body: Column(
        children: [Expanded(child: mainContent)],
      ),
      bottomNavigationBar: const ExpensesPageAd(),
    );
  }
}
