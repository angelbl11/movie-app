import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  final String loadingText;
  const CustomLoading({super.key, required this.loadingText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
            strokeWidth: 3,
          ),
          const SizedBox(height: 20),
          Text(loadingText, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
