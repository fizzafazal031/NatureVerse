
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'theme_provider.dart';
import 'favorite_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FavoriteProvider.instance.loadFavorites();

  runApp(const NatureVerse());
}

class NatureVerse extends StatelessWidget {
  const NatureVerse({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppSettings.isDarkMode,
      builder: (context, isDark, child) {
        return ValueListenableBuilder<double>(
          valueListenable: AppSettings.fontScale,
          builder: (context, fontSize, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'NatureVerse',

              theme: AppSettings.lightTheme.copyWith(
                textTheme: AppSettings.lightTheme.textTheme.apply(
                  fontSizeFactor: fontSize,
                ),
              ),

              darkTheme: AppSettings.darkTheme.copyWith(
                textTheme: AppSettings.darkTheme.textTheme.apply(
                  fontSizeFactor: fontSize,
                ),
              ),

              themeMode: isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,

              home: OnboardingScreen(),
            );
          },
        );
      },
    );
  }
}
