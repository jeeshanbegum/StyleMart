import 'package:flutter/material.dart';

const Map<int, String?> bottomNavTabRoutes = {
  0: '/home',
  1: '/accessories',
  2: '/shoes',
  3: null,
};

void handleBottomNavTap(BuildContext context, int index, int currentIndex) {
  if (index == currentIndex) return;

  final routeName = bottomNavTabRoutes[index];
  if (routeName == null || routeName.isEmpty) return;

  Navigator.pushReplacementNamed(context, routeName);
}
