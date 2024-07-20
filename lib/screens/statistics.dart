import '../provider/ad_provider.dart';
import '../provider/filters_provider.dart';
import '../widgets/chart/chart.dart';
import '../widgets/chart/chart_pie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatisticsScreen extends ConsumerStatefulWidget {
  const StatisticsScreen({super.key});

  @override
  ConsumerState<StatisticsScreen> createState() {
    return _StatisticsScreen();
  }
}
class _StatisticsScreen extends ConsumerState<StatisticsScreen>{
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adProvider.notifier).initialiseFullPageAd();
    });
  }

  

  @override
  Widget build(BuildContext context) {
    final filteredExpenses = ref.watch(filteredExpensesProvider);
    final adNotifier = ref.watch(adProvider);
    
    return PopScope(
      onPopInvoked: (didPop){
        if(adNotifier.isFullPageAdLoaded){
          adNotifier.fullPageAd!.show();
        } 
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.statistics),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.barChart),
              Chart(expenses: filteredExpenses),
              const SizedBox(height: 18,),
              Text(AppLocalizations.of(context)!.pieChart),
              ChartPie(expenses: filteredExpenses)
            ],
          ),
        ),
      ),
    );
  }
}
