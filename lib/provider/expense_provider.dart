import '../models/expense.dart';
import '../screens/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super([]) {
    _fetchExpenses();
  }

  void _fetchExpenses() {
    FirebaseFirestore.instance
        .collection('expenses')
        .orderBy('date', descending: true)
        .snapshots()
        .listen((snapshot) {
      final expenses = snapshot.docs.map((doc) {
        return Expense(
          id: doc.id,
          title: doc['title'],
          amount: (doc['amount'] as num).toDouble(),
          date: (doc['date'] as Timestamp).toDate(),
          category:
              getEnumFromString<Category>(doc['category'], Category.values),
        );
      }).toList();
      state = expenses;
    });
  }

  void addExpense(Expense expense) async {
    try {
      await FirebaseFirestore.instance
          .collection('expenses')
          .doc(expense.id)
          .set({
        'title': expense.title,
        'amount': expense.amount,
        'date': expense.date,
        'category': expense.category.name,
      });
    } catch (error) {
      throw Exception(['Error adding expense : $error ']);
    }
  }

  void removeExpense(Expense expense) async {
    try {
      await FirebaseFirestore.instance
          .collection('expenses')
          .doc(expense.id)
          .delete();
    } catch (error) {
      throw Exception(['Error deleting expense : $error ']);
    }
  }

  void openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: addExpense),
    );
  }
}

T getEnumFromString<T>(String key, List<T> values) {
  return values.firstWhere(
    (value) => key == value.toString().split('.').last,
    orElse: () => throw ArgumentError('No matching enum value found'),
  );
}

final expenseProvider =
    StateNotifierProvider<ExpenseNotifier, List<Expense>>((ref) {
  return ExpenseNotifier();
});
