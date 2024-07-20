import '../../models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseItem extends ConsumerWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge!,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('Rs. ${expense.amount.toStringAsFixed(2)}', style: Theme.of(context).textTheme.bodyMedium!),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formattedDate,
                        style: Theme.of(context).textTheme.bodyMedium!)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
