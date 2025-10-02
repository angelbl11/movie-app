import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/home/home_screen.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/providers/theme_controller.dart';
import 'package:themed/themed.dart';

void main() {
  runApp(ProviderScope(child: Themed(child: const MainApp())));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final currentTheme = ref.watch(themeProvider);

    return MaterialApp(
      theme: currentTheme,
      themeMode: themeMode,
      home: _buildBackground(
        child: const Scaffold(body: HomeScreen()),
        themeMode: themeMode,
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _buildBackground({
    required Widget child,
    required ThemeMode themeMode,
  }) {
    switch (themeMode) {
      case ThemeMode.light:
        return AppTheme.lightGradientBackground(child: child);
      case ThemeMode.dark:
        return AppTheme.gradientBackground(child: child);
      case ThemeMode.system:
        return AppTheme.gradientBackground(child: child); // Fallback to dark
    }
  }
}
