import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const StyleMartApp());
}

class StyleMartApp extends StatelessWidget {
  const StyleMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StyleMart',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: AppRouter.routes,
    );
  }
}
