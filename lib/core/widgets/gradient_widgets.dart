import 'package:flutter/material.dart';
import 'package:aura_box/aura_box.dart';
import 'package:movie_app/core/theme/theme.dart';

class GradientWidgets {
  static Widget gradientScaffold({
    required Widget body,
    PreferredSizeWidget? appBar,
    Widget? bottomNavigationBar,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
  }) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBar,
      body: AuraBox(
        spots: [
          AuraSpot(
            color: AppTheme.darkPrimary.color,
            radius: 200.0,
            alignment: Alignment.topLeft,
            blurRadius: 15.0,
            stops: const [0.0, 0.6],
          ),
          AuraSpot(
            color: AppTheme.darkSecondary.color,
            radius: 300.0,
            alignment: Alignment.bottomRight,
            blurRadius: 20.0,
            stops: const [0.0, 0.8],
          ),
        ],
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
        ),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  /// Card con degradado de superficie usando aura_box
  static Widget gradientCard({
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: AuraBox(
        spots: [
          AuraSpot(
            color: AppTheme.darkSurface.color,
            radius: 100.0,
            alignment: Alignment.topLeft,
            blurRadius: blurRadius ?? 10,
            stops: const [0.0, 0.5],
          ),
          AuraSpot(
            color: AppTheme.darkSurfaceVariant.color,
            radius: 120.0,
            alignment: Alignment.bottomRight,
            blurRadius: (blurRadius ?? 10) + 5,
            stops: const [0.0, 0.7],
          ),
        ],
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }

  /// Botón con degradado de acento usando aura_box
  static Widget gradientButton({
    required String text,
    required VoidCallback onPressed,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: AuraBox(
        spots: [
          AuraSpot(
            color: AppTheme.darkPrimary.color,
            radius: 80.0,
            alignment: Alignment.topLeft,
            blurRadius: blurRadius ?? 8,
            stops: const [0.0, 0.6],
          ),
          AuraSpot(
            color: AppTheme.darkSecondary.color,
            radius: 100.0,
            alignment: Alignment.bottomRight,
            blurRadius: (blurRadius ?? 8) + 3,
            stops: const [0.0, 0.8],
          ),
        ],
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding:
                  padding ??
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Center(
                child: Text(text, style: textStyle ?? AppTheme.button),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget customGradientContainer({
    required List<Color> colors,
    required Widget child,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    double? width,
    double? height,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: AuraBox(
        spots: colors.asMap().entries.map((entry) {
          int index = entry.key;
          Color color = entry.value;
          return AuraSpot(
            color: color,
            radius: 100.0 + (index * 20),
            alignment: index == 0 ? Alignment.topLeft : Alignment.bottomRight,
            blurRadius: (blurRadius ?? 10) + (index * 2),
            stops: const [0.0, 0.6],
          );
        }).toList(),
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }

  /// AppBar con degradado usando aura_box
  static PreferredSizeWidget gradientAppBar({
    required String title,
    List<Widget>? actions,
    Widget? leading,
    bool centerTitle = true,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      actions: actions,
      leading: leading,
      flexibleSpace: AuraBox(
        spots: [
          AuraSpot(
            color: AppTheme.darkPrimary.color,
            radius: 150.0,
            alignment: Alignment.topLeft,
            blurRadius: blurRadius ?? 5,
            stops: const [0.0, 0.5],
          ),
          AuraSpot(
            color: AppTheme.darkSecondary.color,
            radius: 200.0,
            alignment: Alignment.topRight,
            blurRadius: (blurRadius ?? 5) + 2,
            stops: const [0.0, 0.7],
          ),
        ],
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
        ),
        child: Container(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  /// Bottom Navigation Bar con degradado usando aura_box
  static Widget gradientBottomNavBar({
    required int currentIndex,
    required ValueChanged<int> onTap,
    required List<BottomNavigationBarItem> items,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return AuraBox(
      spots: [
        AuraSpot(
          color: AppTheme.darkSurface.color,
          radius: 120.0,
          alignment: Alignment.bottomLeft,
          blurRadius: blurRadius ?? 10,
          stops: const [0.0, 0.6],
        ),
        AuraSpot(
          color: AppTheme.darkSurfaceVariant.color,
          radius: 150.0,
          alignment: Alignment.bottomRight,
          blurRadius: (blurRadius ?? 10) + 3,
          stops: const [0.0, 0.8],
        ),
      ],
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.rectangle,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: items,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppTheme.darkPrimary.color,
        unselectedItemColor: AppTheme.darkTextSecondary.color,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  /// Widget con efecto de aura brillante usando aura_box
  static Widget auraGlowWidget({
    required Widget child,
    required List<Color> colors,
    double? blurRadius,
    double? spreadRadius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    double? width,
    double? height,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: AuraBox(
        spots: colors.asMap().entries.map((entry) {
          int index = entry.key;
          Color color = entry.value;
          return AuraSpot(
            color: color,
            radius: 150.0 + (index * 30),
            alignment: index == 0 ? Alignment.topLeft : Alignment.bottomRight,
            blurRadius: (blurRadius ?? 15) + (index * 3),
            stops: const [0.0, 0.7],
          );
        }).toList(),
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius ?? BorderRadius.circular(20),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(20),
          child: child,
        ),
      ),
    );
  }

  /// Card de película con efecto de aura especial
  static Widget movieCardAura({
    required Widget child,
    required String movieTitle,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: AuraBox(
        spots: [
          AuraSpot(
            color: AppTheme.darkSurface.color,
            radius: 120.0,
            alignment: Alignment.topLeft,
            blurRadius: blurRadius ?? 12,
            stops: const [0.0, 0.6],
          ),
          AuraSpot(
            color: AppTheme.darkSurfaceVariant.color,
            radius: 140.0,
            alignment: Alignment.bottomRight,
            blurRadius: (blurRadius ?? 12) + 4,
            stops: const [0.0, 0.8],
          ),
        ],
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.1),
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.1),
                ],
              ),
            ),
            child: Padding(
              padding: padding ?? const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieTitle,
                    style: AppTheme.heading1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Botón flotante con efecto de aura
  static Widget auraFloatingActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    String? tooltip,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return AuraBox(
      spots: [
        AuraSpot(
          color: AppTheme.darkPrimary.color,
          radius: 60.0,
          alignment: Alignment.center,
          blurRadius: blurRadius ?? 10,
          stops: const [0.0, 0.6],
        ),
        AuraSpot(
          color: AppTheme.darkSecondary.color,
          radius: 80.0,
          alignment: Alignment.center,
          blurRadius: (blurRadius ?? 10) + 5,
          stops: const [0.0, 0.8],
        ),
      ],
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(28),
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        tooltip: tooltip,
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  /// Container con múltiples capas de aura
  static Widget multiAuraContainer({
    required Widget child,
    required List<List<Color>> colorGroups,
    List<double>? blurRadii,
    List<double>? spreadRadii,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    double? width,
    double? height,
  }) {
    Widget result = child;

    for (int i = colorGroups.length - 1; i >= 0; i--) {
      List<Color> colors = colorGroups[i];
      result = AuraBox(
        spots: colors.asMap().entries.map((entry) {
          int colorIndex = entry.key;
          Color color = entry.value;
          return AuraSpot(
            color: color,
            radius: 100.0 + (i * 20) + (colorIndex * 10),
            alignment: colorIndex == 0
                ? Alignment.topLeft
                : Alignment.bottomRight,
            blurRadius: (blurRadii?[i] ?? 8 + (i * 2)) + (colorIndex * 2),
            stops: const [0.0, 0.6],
          );
        }).toList(),
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
        child: result,
      );
    }

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: result,
      ),
    );
  }
}
