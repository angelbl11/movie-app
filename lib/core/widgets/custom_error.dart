import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/theme.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.error, required this.title});
  final String error;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: AppTheme.darkError.color),
          const SizedBox(height: 20),
          Text(title, style: AppTheme.heading3),
          const SizedBox(height: 8),
          Text(error, style: AppTheme.body2, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
