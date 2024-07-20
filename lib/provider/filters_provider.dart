import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/expense.dart';
import 'expense_provider.dart';

enum Filter {
  onlyFood,
  onlyTravel,
  onlyLeisure,
  onlyWork
}

class FiltersProvider extends StateNotifier<Map<Filter, bool>> {
  FiltersProvider() : super({
    Filter.onlyFood: false,
    Filter.onlyTravel: false,
    Filter.onlyLeisure: false,
    Filter.onlyWork: false,
  });

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setAllFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersProvider, Map<Filter, bool>>((ref) {
  return FiltersProvider();
});

final filteredExpensesProvider = Provider((ref) {
  final expenses = ref.watch(expenseProvider);
  final activeFilters = ref.watch(filtersProvider);

  final activeCategories = activeFilters.entries
      .where((entry) => entry.value)
      .map((entry) {
        switch (entry.key) {
          case Filter.onlyFood:
            return Category.food;
          case Filter.onlyTravel:
            return Category.travel;
          case Filter.onlyLeisure:
            return Category.leisure;
          case Filter.onlyWork:
            return Category.work;
        }
      })
      .toList();

  if (activeCategories.isEmpty) {
    return expenses;
  }

  final filteredExpenses = expenses.where((expense) {
    return activeCategories.contains(expense.category);
  }).toList();

  return filteredExpenses;
});
