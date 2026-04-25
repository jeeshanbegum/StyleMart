import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/home_screen.dart';
import '../screens/product_listing_screen.dart';
import '../screens/wishlist_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/product_details_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/order_success_screen.dart';
import '../screens/track_order_screen.dart';
import '../screens/accessories_screen.dart';
import '../screens/shirts_screen.dart';
import '../screens/shoes_screen.dart';
import '../screens/tops_screen.dart';
import '../screens/handbags_screen.dart';
import '../screens/watches_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/home': (context) => const HomeScreen(),
        '/shop': (context) => const ProductListingScreen(),
        '/wishlist': (context) => const WishlistScreen(),
        '/cart': (context) => const CartScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/product': (context) => const ProductDetailsScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/success': (context) => const OrderSuccessScreen(),
        '/track': (context) => const TrackOrderScreen(),
        '/accessories': (context) => const AccessoriesScreen(),
        '/shirts': (context) => const ShirtsScreen(),
        '/shoes': (context) => const ShoesScreen(),
        '/tops': (context) => const TopsScreen(),
        '/handbags': (context) => const HandbagsScreen(),
        '/watches': (context) => const WatchesScreen(),
      };
}
