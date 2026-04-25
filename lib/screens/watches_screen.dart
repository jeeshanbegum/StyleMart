import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';
import '../widgets/category_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/product_card.dart';

class WatchesScreen extends StatelessWidget {
  const WatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CategoryAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero with glassmorphism overlay
            _buildHero(),
            const SizedBox(height: 40),
            // Collection header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'The Collection',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onSecondaryFixed,
                    ),
                  ),
                  Text(
                    '4 SELECTED PIECES',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                      color: AppColors.tertiary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Product Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 32,
                childAspectRatio: 0.45,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC3CwPSzwM5149EcWcL840m83cpRWjwsshqIQyV2AT3fzZNj_4NwOIIvgL-4-ONVCWBVMX9Ix8Oq44y6_nHqCesaxRaaCkGTCVBXZYWP7Morr5ijK2kbLUQTExb5BTtATcHSUMsR-Z3h5BCMZUOEIg30vYe3oLDai0lwC3p94XlPFVitM5hxS3oBml3c40XKqKp5ydEwDdZfAzsjTpTqztAGe3hOU7gAiG5BrFOyWBVuvf3O70i3OqN2uF9WiqgC29MfeXpRfC2vg',
                    name: 'Heritage Chronograph',
                    price: '\$850',
                    subtitle: 'Midnight Black',
                    showNewBadge: true,
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAwQlsYDPilMCDOW8eXFeAod7L8UptqcuIrvGuYqNovc7O8QmQPZra9PmRhllJueQkeI_N8qQiRVNVinGKtmQCTPovrF6foQZVQbGF8zxzvGo-jr3N01C6QyH7EZ5E9g-LZJijZYk2VEUWtzL9YwAqSz292Ng-Dow-OHf3Q-NakTRLsyVD5vVy9MNWjd6g6EDQ8uB-CLKKHQQSouTg-hob_L_XxXJ476v0M6x55qf-E_qqPFFG3GTxaW3UOOj0aZuRfWAmATO0Ysw',
                    name: 'Minimalist Gold',
                    price: '\$620',
                    subtitle: 'Rose Gold',
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCo0lnr9grrvbFtXBv0gZnJB87OC9NBiLPuvrMj6bF9Bd1TqixKX9e1mADOKtwlZf4y2ggpJBjfQzNHiJ-I2vInvMb5POW3O4e1k4hGbeG7IFaMVcV25zsNDXkBNs9wU1wu1PLOrjJLfboULB1yDkZCyS1nlzboSxAuNJDyKu8vEgzxcXUSzpGKt4rxDQL1FMdaEW706EGBjldChPVHDaZXlM8ZCvIzwc1rJWScqxuzgJn1047kmiltivszrWil-TH474F7u1qG4A',
                    name: 'Diver Special',
                    price: '\$1,100',
                    subtitle: 'Ocean Blue',
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDWaqKSkxyLdUmPFPvF2l19jSlsyHWoTaGT-AJhgAMW9H8J3J33D5bfjflSe_loyglnIAHwRjtgtUUHg9zCNVcz50soGfcQWI1b7uJsRH83oT37IbkwKKRHQhBnr7-8WpqGak4_ceoj4QBykAGCl2CgkCqYPf34cEWu4Lx1QbLC9RJt2IaoLBidyOP-KMa3ImXSvvuMFt1ccDq9C2x7WvC8QWVyhlFj4rAkcXAmt4ovYU93J1ZZju_e1wi0Midd4WAJXmshf4dNdA',
                    name: 'Classic Leather',
                    price: '\$450',
                    subtitle: 'Walnut Brown',
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

  Widget _buildHero() {
    return SizedBox(
      height: 618,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCF28uxb-Z1uPRiw2UmKGa784FwYgH3ywywXYawq0rM2nwz0q8a3JKHMhcu6_RWrSmlEeZ7PQMmsjk3MnGjh5tO9yDpVHzcmKGWrOwFcqDIl2dnHqGi5e8Djs3rICBNSkt9Dzj4HqIRLKePac3SrRLfM3E_q0-hyDH5HkbARiNSDYUbOxcnprfARAsd0YHwMQUiSZeiOQEvmhDfKrpPi5wb9lymimrQwvrvGobjSO6EnAD3Yb_uKsHVwiPvyO5uU6Ss9IdV5_kaTw',
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
                  AppColors.onSecondaryFixed.withValues(alpha: 0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Glassmorphism card overlay
          Positioned(
            bottom: 32,
            left: 24,
            child: Container(
              padding: const EdgeInsets.all(24),
              constraints: const BoxConstraints(maxWidth: 280),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CURATED VOLUME I',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4,
                      color: AppColors.gold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'The Watch Edit',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.5,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'A masterclass in horological precision and timeless aesthetic.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
