import '../models/expense.dart';

final List<Expense> registeredExpenses = [
  Expense(
      title: 'Flutter Course',
      amount: 555,
      date: DateTime.now(),
      category: Category.work),
  Expense(
      title: 'Cinema',
      amount: 360,
      date: DateTime.now(),
      category: Category.leisure)
];
