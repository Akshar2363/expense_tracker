import 'dart:async';

import 'data/languages.dart';
import 'provider/language_provider.dart';
import 'provider/theme_provider.dart';
import 'screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'firebase_options.dart';

var kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class LocaleNotifier extends WidgetsBindingObserver {
  final WidgetRef ref;

  LocaleNotifier(this.ref);

  @override
  void didChangeLocales(List<Locale>? locales) {
    if (locales != null && locales.isNotEmpty) {
      final newLocale = locales.first;
      ref.read(languageProvider.notifier).updateLanguage(newLocale.languageCode);
    }
  }
  
}


class MyApp extends ConsumerStatefulWidget{
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() {
    return _MyApp();
  }
}

class _MyApp extends ConsumerState<MyApp> {

  late final LocaleNotifier _localeNotifier;

  @override
  void initState() {
    super.initState();
    _localeNotifier = LocaleNotifier(ref);
    WidgetsBinding.instance.addObserver(_localeNotifier);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_localeNotifier);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                color: kDarkColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
              titleMedium: TextStyle(
                color: kDarkColorScheme.onSecondaryContainer,
                fontSize: 14,
              ),
              bodyMedium: TextStyle(
                color: kDarkColorScheme.onSurface,
                fontSize: 12,
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
              titleMedium: TextStyle(
                color: kColorScheme.onSecondaryContainer,
                fontSize: 14,
              ),
              bodyMedium: TextStyle(
                color: kColorScheme.onSurface,
                fontSize: 12,
              ),
            ),
      ),
      themeMode: themeMode ? ThemeMode.dark : ThemeMode.light,
      title: 'Expense Tracker',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(ref.watch(languageProvider).abbreviation),
      supportedLocales: languagesList.map((language)=>Locale(language.abbreviation)).toList(),
      home: const TabsScreen(),
    );
  }
}
