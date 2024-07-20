import '../data/languages.dart';
import '../provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageList extends ConsumerWidget {
  const LanguageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(languageProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.languageSubtitle),
      ),
      body: ListView.builder(
        itemCount: languagesList.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(languagesList[index].title),
          onTap: ()=>languages.changeLanguage(languagesList[index]),
        ),
      ),
    );
  }
}
