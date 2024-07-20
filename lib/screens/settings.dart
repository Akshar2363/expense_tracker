import '../provider/filters_provider.dart';
import '../provider/theme_provider.dart';
import 'language_list.dart';
import '../widgets/ads/settingsPageAd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.filters,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    SwitchListTile(
                      value: activeFilters[Filter.onlyFood]!,
                      onChanged: (isChecked) {
                        ref
                            .read(filtersProvider.notifier)
                            .setFilter(Filter.onlyFood, isChecked);
                      },
                      title: Text(
                        AppLocalizations.of(context)!.onlyFood,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      subtitle: Text(
                        AppLocalizations.of(context)!.onlyFoodSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      contentPadding:
                          const EdgeInsets.only(left: 34, right: 22),
                    ),
                    SwitchListTile(
                      value: activeFilters[Filter.onlyLeisure]!,
                      onChanged: (isChecked) {
                        ref
                            .read(filtersProvider.notifier)
                            .setFilter(Filter.onlyLeisure, isChecked);
                      },
                      title: Text(
                        AppLocalizations.of(context)!.onlyLeisure,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      subtitle: Text(
                        AppLocalizations.of(context)!.onlyLeisureSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      contentPadding:
                          const EdgeInsets.only(left: 34, right: 22),
                    ),
                    SwitchListTile(
                      value: activeFilters[Filter.onlyTravel]!,
                      onChanged: (isChecked) {
                        ref
                            .read(filtersProvider.notifier)
                            .setFilter(Filter.onlyTravel, isChecked);
                      },
                      title: Text(
                        AppLocalizations.of(context)!.onlyTravel,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      subtitle: Text(
                        AppLocalizations.of(context)!.onlyTravelSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      contentPadding:
                          const EdgeInsets.only(left: 34, right: 22),
                    ),
                    SwitchListTile(
                      value: activeFilters[Filter.onlyWork]!,
                      onChanged: (isChecked) {
                        ref
                            .read(filtersProvider.notifier)
                            .setFilter(Filter.onlyWork, isChecked);
                      },
                      title: Text(
                        AppLocalizations.of(context)!.onlyWork,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      subtitle: Text(
                        AppLocalizations.of(context)!.onlyWorkSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      contentPadding:
                          const EdgeInsets.only(left: 34, right: 22),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    SwitchListTile(
                      value: ref.watch(themeProvider),
                      onChanged: (isChecked) {
                        ref.watch(themeProvider.notifier).toggleTheme();
                      },
                      title: Text(
                        AppLocalizations.of(context)!.darkMode,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      subtitle: Text(
                        AppLocalizations.of(context)!.darkModeSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      contentPadding:
                          const EdgeInsets.only(left: 34, right: 22),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.others,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.language,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      subtitle: Text(
                        AppLocalizations.of(context)!.languageSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 34, right: 22),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const LanguageList(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const SettingsPageAd(),
    );
  }
}
