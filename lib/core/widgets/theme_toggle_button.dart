import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/providers/theme_controller.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final themeController = ref.read(themeControllerProvider.notifier);

    return IconButton(
      onPressed: () => themeController.toggleTheme(),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
          key: ValueKey(themeMode),
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      tooltip: themeMode == ThemeMode.dark
          ? 'Cambiar a tema claro'
          : 'Cambiar a tema oscuro',
    );
  }
}

class ThemeToggleCard extends ConsumerWidget {
  const ThemeToggleCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final themeController = ref.read(themeControllerProvider.notifier);

    return Card(
      child: ListTile(
        leading: Icon(
          themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text('Tema', style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(
          themeMode == ThemeMode.dark ? 'Modo oscuro' : 'Modo claro',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Switch(
          value: themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeController.setThemeMode(
              value ? ThemeMode.dark : ThemeMode.light,
            );
          },
          activeColor: Theme.of(context).colorScheme.primary,
        ),
        onTap: () => themeController.toggleTheme(),
      ),
    );
  }
}
