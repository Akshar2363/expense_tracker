import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

T getEnumFromString<T>(String value, List<T> enumValues) {
  return enumValues.firstWhere(
    (e) => e.toString().split('.').last == value,
    orElse: () => throw ArgumentError('Invalid enum value: $value'),
  );
}

extension CategoryExtension on Category {
  String title(BuildContext context) {
    switch (this) {
      case Category.food:
        return AppLocalizations.of(context)!.onlyFood;
      case Category.travel:
        return AppLocalizations.of(context)!.onlyTravel;
      case Category.leisure:
        return AppLocalizations.of(context)!.onlyLeisure;
      case Category.work:
        return AppLocalizations.of(context)!.onlyWork;
      default:
        return '';
    }
  }
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    String? id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
