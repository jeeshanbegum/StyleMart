import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/category_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/product_card.dart';

class ShoesScreen extends StatelessWidget {
  const ShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CategoryAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Hero with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: const HeroSection(
                imageUrl: 'https://lh3.googleusercontent.com/aida/ADBb0uiKZDhYyAKnzF0rgw_4Z297a5P87VAcRLZcTeVRQlESuaGBiggshYVLonz9RLCpHgLKZ8-dylC87aHTdx0imiUnunL_H1wp9qD5DxD72RZnOUBLiFikZOGi7F4Qx6GRxPrXkTM2CBzkuhLOe7Ydvyb2Az4-9hJiSZ8Mlp1tVdNcxfySrdkoV0vS0z4EY7ZpvmWBXWuNP6IIZzscYweEP4S1sNgCK3Jeef4SUzUxDRUs8KgSfAVWiO37IqlZznWucTwLsDl-9e4',
                title: 'The Footwear Edit',
                label: 'Curated Collection',
                height: 420,
              ),
            ),
            const SizedBox(height: 32),
            // Section title with gold underline
            Text(
              'New Arrivals',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.onSecondaryFixed,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(height: 24),
            // Product grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 32,
              childAspectRatio: 0.50,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ProductCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCUqXjqn_VbWITUWvQIl3m923mqWGelu9pM5u5K9jTi8rdi89Rt7z5hjXGUG9ls4rY0ClAjMGVvjSCAF8BRsCs3QSeI-Y7L0uLslW5oSiGXdQfsv7aAkyu3tPARUL6B8ui70haxyIUZYDMIQdPEI7JaTmLVy8SQuIeRn8rYnZxs0CXhhUBcJVYzIOey5D0Pl3xUNi_I6FbzeggutiC07WG3bYPQel_sFXv4zmdRcyixYM8NoMSgUXb7z9b6lWfurwNHF_ku06JAzA',
                  name: 'Platform Sneakers',
                  price: '\$120.00',
                  showFavorite: true,
                ),
                ProductCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDQyNu2wbmYl89iLvjo8lfKtCjkuBHzAQY5MLv_XQ0frCsTN3IF0vuwddO0LS5gSIJEaEAzTXqUZCkLQ7QtiMqdhORSqsq1EX-5ds3xz_A05lmiEd4APzJbxYCvD9qTWU1u97_VA6e6MbOy2QSw8xbDAx-6Kwq7b53FWtEfQx1mOykXjFBVytWwmS1fNOjhsyrDEhT_4v5mVKnIAB6Ao-IwnNJcoO02bQlHFoC85PA7Rj9tQCT3qEuI-pSn0AGkSN9EJOSQVo47YA',
                  name: 'Rose Gold Sandals',
                  price: '\$145.00',
                  showFavorite: true,
                ),
                ProductCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCJa775lBNiXFZ-H1nScaaVwFw4AlenaRL0k0SD_BZb50nM4dTucuD7OLFJA9UIuU74LSk6zmegqS4aVVJjAUW1AGlAwGC82WUOJ5SkVG_iHbMOPxeNcJrMhhJolxcsn9_NzAfRjRVaT3Ljtwe8zwzT-Qw4YAwIQb_FpxABrDOULaP6mJgKDASR8qerEgUguJsCjB58wDwZqlna5CF075AuW_5MBA0ZhatmtmO4Suc4CdpTjl6e72qOWAXlF4rwyZ73Kr96kGbYSQ',
                  name: 'Pink Ballet Flats',
                  price: '\$95.00',
                  showFavorite: true,
                ),
                ProductCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAbjwX5Fh7O0VCcWZJNFS59V-fN16yAoJnzKUay33cGBsytIritkkKxRcC7GRA5wLE1bRtcudsrxPh05eBnz6TrCKq4Y4HgFZkd-LapX-JMOWDnqQL1XCkuVu9j5pE2RxxFN80ZxkxmANUYTgzzcRaRYQvAQkWFhW7_Blxfrvl-DjXyd5EuObz8yBeE-M1uWLgv4NTMgQIVMMWfeLpyrL_6227xBVMA47ONikNUmb_yctTI4Kf7f2xiSwNqh7jZ7r8WOvH9h6ZHEA',
                  name: 'Floral Slip-ons',
                  price: '\$85.00',
                  showFavorite: true,
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
