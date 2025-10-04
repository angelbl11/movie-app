import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/presentation/main/main_home_screen.dart';
import 'package:movie_app/providers/theme_controller.dart';
import 'package:themed/themed.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded<Future<void>>(
    () async {
      runApp(ProviderScope(child: Themed(child: const MainApp())));
    },
    (error, stackTrace) {
      debugPrint('Caught error in runZonedGuarded: $error');
      debugPrint(stackTrace.toString());
    },
  );

  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint('Caught error in FlutterError.onError: ${details.exception}');
    debugPrint(details.stack.toString());
  };
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
        child: const MainHomeScreen(),
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
        return AppTheme.gradientBackground(child: child);
    }
  }
}
