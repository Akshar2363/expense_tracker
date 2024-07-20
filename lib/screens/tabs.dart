import '../provider/expense_provider.dart';
import 'statistics.dart';
import 'expenses.dart';
import 'settings.dart';
import '../widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    switch (identifier) {
      case 'settings':
        Navigator.of(context) .push(MaterialPageRoute(builder: (ctx) => const SettingsScreen()));
        break;
      case 'statistics':
        Navigator.of(context) .push(MaterialPageRoute(builder: (ctx) => const StatisticsScreen()));
        break;
      default:
        Navigator.of(context).pop();
        break;
    }
  }


  @override
  Widget build(BuildContext context) {

    Widget activePage = const ExpensesTracker();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.spendWise),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){ref.watch(expenseProvider.notifier).openAddExpenseOverlay(context);},
          ),
        ],
      ),
      drawer: SideDrawer(onSelectScreen: _setScreen),
      body: activePage,
    );
  }
}