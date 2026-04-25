import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';
import '../widgets/category_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/product_card.dart';

class ShirtsScreen extends StatelessWidget {
  const ShirtsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heroHeight = MediaQuery.of(context).size.height * 0.6;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CategoryAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero
            _buildHero(heroHeight),
            const SizedBox(height: 32),
            // Product Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 40,
                childAspectRatio: 0.45,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAAzxAI4nnyPXGoiE9lKXsipUmOPg1og_W8JnRGg_8rqXSJn07bGDfXn2pWk-m3MFdKPLsD-iFft6Su14BrctiEUQdNVjkOZBQJV0_Y4PrvyyEUUgfpZ05wH7YqujbZsTiZz0a5QvtOd0Zq218bhKHxu2BQ_J1fx-vJOsE5rBEpZLzBm3epQVxJ3QHPqM8tEOSo9LBpJZY7vRbkEel20AdwYG0biwQaD09gciBqu_x8J2AmzX4fUeb9QKxbYmpatvbRvXT7rV_OSA',
                    name: 'Oxford Shirt',
                    price: '\$120',
                    subtitle: 'Sky Blue',
                    showFavorite: true,
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBvEgfNVm_8NXveZ42muNrYxifKhHlL-kee_Qob3cbefra5Uf9RlqaCEJ9aAAaGbuD4iaCZ8B0XbnBCpvI-I75Ekti1GTtolslLR6hAxOOmNnw0qSpYc4inatFmhEMVtNnPAqXPPPuExnD4BzjRkyAWqN99_uG2ZHO0AN5nRf4Z4UQPU_pvF5kyrc7LDFRujubgGFbeb434GiHHrlMdHVKsgAoss31j7jbp5LabrP1e1kEzXM_GPSzWcWw2PBH5LxfKSP0tlZgJNw',
                    name: 'Oxford Shirt',
                    price: '\$120',
                    subtitle: 'Pale Pink',
                    showFavorite: true,
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDphrjzttal9JN6BNGM8DmBy8DsnRG4DX85vr_PH-3Oq_t2JQHw4Rj4YkM2BjAD-VIR9zmvtlFp1z-8-4BQf6idfnmOePejqMzpy1tc_KaAnCWtcAl8ACa7vQdpbylC_vz57myEA-W_3TB1fkE5hnPfup8Nc9d6ccUvYnu-RTM5NayNSCLwMxpfovU5ic9Xk-NlJRWbCmPDcgc3J9_loBT63kTAulClTLSgcHI_FKWi9rdaytlnBdeVXVPW2vPg2GmGCB4jydr4Vw',
                    name: 'Oxford Shirt',
                    price: '\$120',
                    subtitle: 'Crisp White',
                    showFavorite: true,
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBS-o7qiks2qaGc3B5bBTKwzcbeW0c_YzLeIOHmds8gh3bfjiGOILBCgf7ZKqkxANOLNFfRgpFoHgY5Tl2NNDqgmJxwX7paaB6abJXZWxUQc8P1UersA5SsMRm-SC5iGRmGuIjVlBBgCjyCJEFZDnOcIdswhZkzaBuXdvrQrr9A5t53vNG8Q85_3hAYIMkLCn5-c45cWyF-MbheXsJMppNXraEYKtbEKlORgsXXb76ns4V7Qz0MjERqP-gdzV48E5Jnj63GEl3tbw',
                    name: 'Oxford Shirt',
                    price: '\$120',
                    subtitle: 'Forest Green',
                    showFavorite: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(double height) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAAzxAI4nnyPXGoiE9lKXsipUmOPg1og_W8JnRGg_8rqXSJn07bGDfXn2pWk-m3MFdKPLsD-iFft6Su14BrctiEUQdNVjkOZBQJV0_Y4PrvyyEUUgfpZ05wH7YqujbZsTiZz0a5QvtOd0Zq218bhKHxu2BQ_J1fx-vJOsE5rBEpZLzBm3epQVxJ3QHPqM8tEOSo9LBpJZY7vRbkEel20AdwYG0biwQaD09gciBqu_x8J2AmzX4fUeb9QKxbYmpatvbRvXT7rV_OSA',
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: AppColors.surfaceContainer),
            errorWidget: (context, url, error) => Container(color: AppColors.surfaceContainer),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.7),
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0.1),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SUMMER COLLECTION',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'The Essential\nShirts.',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -1,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      'Filter',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.7),
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '/',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.3)),
                      ),
                    ),
                    Text(
                      'Sort',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
