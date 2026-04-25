import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_nav_bar.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(height: 8, thickness: 8, color: AppColors.surfaceContainer),
                _buildFilterChips(),
                _buildHeroEditorial(),
                _buildProductGrid(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: AppColors.surface,
      pinned: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.iconGray),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Women',
        style: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.darkNavy,
          letterSpacing: -0.5,
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list, color: AppColors.iconGray),
          onPressed: () {},
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.iconGray),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surface, width: 1),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildFilterChips() {
    final filters = ['Price', 'Size', 'Color', 'Brand'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: AppColors.onSecondaryFixed,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'All Items',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.surface,
              ),
            ),
          ),
          ...filters.map((filter) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                children: [
                  Text(
                    filter,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.tertiary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.expand_more, size: 16, color: AppColors.tertiary),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildHeroEditorial() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            SizedBox(
              height: 320,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBEILRLQb7p411PFSA6R-VfIbeMQBHmZHXFfXC96mvL3xrhyxtY5nMxUi6OvEAQB8hYDznj4sAFHqE6G0Es_lecEjeAvGbkLFHZel7dMw6ra8uz2XL7Eri2AzV5NHoYzmA7KhR4bJeshMRr1ab6DWRqY2x9R0W-Rc5UlKk4Dybnt6e4d0eU5nEBFjEofBXi18VPvIT8W_zLHywgLHV-iZMBg8HKRPfQGNYrbsWhHPJwHlCiksFhgi66u_otykj6uevmIXIGYpFgNw',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: AppColors.surfaceContainerHigh),
                errorWidget: (context, url, error) => Container(color: AppColors.surfaceContainerHigh),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      AppColors.onSecondaryFixed.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEW SEASON',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 3.0, // 0.3em tracking roughly
                      color: AppColors.surface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ephemeral\nElegance',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                      color: AppColors.surface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryContainer,
                      foregroundColor: AppColors.onPrimaryFixed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      elevation: 0,
                    ),
                    child: Text(
                      'EXPLORE',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    final products = [
      {
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCPRmVCOH_ecPjeqGLNPWP4lP67CsTrWqvQtlP-yoSbdYfLAD6wTHJaydscBcWkcghIBykgMyk28-PQeflMVB5s5yvwAn7Pz4XFgt6PnPrvU9AAy6TPR1k7cLxkdNauDN_mcM4e3iuIEernOjSQ18NY0tVBbIKB666zo_N0bfLuMEIb0ZGXyONf0-HlQdYHKB1u_PIDw9Reqz_9TKq0k1xSJ5buv96zjIyTT3sTOXrolOhlVlwNS3SLti_8-Eri8XuIo9_AdCmYgA',
        'category': 'PREMIUM LABEL',
        'title': 'Silk Drapery Blouse',
        'rating': 4,
        'reviews': 24,
        'price': '\$185.00'
      },
      {
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBpRD85j0T5DVYNApz4BQeFyVysscCoz_hodlmagF7S3VlNZUsv5YJVeve2f7oCpxvNpQtMMmh0iEjRRNUAsAOXZtaBysU3qe4V3r2KbOcgAtaAqWiQ1GLlV72MoMI7TW_v953N-iYqGJaVvol2blyISANAicahItZ3C3ZcXNtrCa5RyJghTrDyN1r_BZUnQlaG77mogOWYNdjKlLXgoyTVzjgGhyVfn6gt99W39oKyvrFKYKG2ZsrlQSV-_N14Zg4FaNveKaqvPw',
        'category': 'SUSTAINABLE',
        'title': 'Canvas Cotton Set',
        'rating': 5,
        'reviews': 82,
        'price': '\$120.00'
      },
      {
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDkRTG4MPeHdbkpRdzMrfymPb3Kqh2hLacmsIZBUGHS-mz2n8yCZuaeGdxpDQ5EUrfNi49NqCNUi0PmPXZj6OdVBonMFHu7ncNvTQ90UNrSGT-tGWrNqPUPApj6Cb8cx_YbjofI-z1ShTkQj4nQbWg9c_0DSBq_kUB9ydCVXvK6xxUR1zTFvMWELm4AiEyeHFcciMuF-XnRyldswsvxLmwerldcuudaMZqlOdAfZO3iY5gITz4HOa42lJ6KNzTVzbC6cLKFM8oEhQ',
        'category': 'FORMAL WEAR',
        'title': 'Structure Wool Blazer',
        'rating': 4,
        'reviews': 45,
        'price': '\$240.00'
      },
      {
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCC2ZejRIUWTavFVkB2wc6qLszt-NMKhh1GukzDGWOZVfVyO93zC2sc66NLrB1shQs6hLfE3yyzAJFKJCHnazOU0wRShjdRR1gXATX7iWx85FkzZ4fE0dZN67N-3bejYz5Vx_iwlNxQbQRX_-ec_iwlYXo_xSIiOjopsuG-tnfwJchch9PxZOq6UIMLMsG4zcqgtMHqaPm-kv1PhNZ-ENImmNalGGq1l18o-txzUz57HCh35N-qj2Z9_tJ05HigJlyQlMCk16PhQg',
        'category': 'NEW ARRIVAL',
        'title': 'Tapered Crease Trousers',
        'rating': 5,
        'reviews': 18,
        'price': '\$95.00'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 40,
          crossAxisSpacing: 16,
          childAspectRatio: 0.45,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/product_details'),
            child: _buildProductItem(
              imageUrl: product['image'] as String,
              category: product['category'] as String,
              title: product['title'] as String,
              rating: product['rating'] as int,
              reviews: product['reviews'] as int,
              price: product['price'] as String,
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductItem({
    required String imageUrl,
    required String category,
    required String title,
    required int rating,
    required int reviews,
    required String price,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image & Favorite
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(color: AppColors.surfaceContainerLow),
                  errorWidget: (context, url, error) => Container(color: AppColors.surfaceContainerLow),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.surface.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size: 16,
                  color: AppColors.tertiary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Category
        Text(
          category,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: AppColors.tertiary,
          ),
        ),
        const SizedBox(height: 4),
        // Title
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.onSecondaryFixed,
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),
        // Rating
        Row(
          children: [
            ...List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                size: 14,
                color: index < rating ? AppColors.primaryContainer : AppColors.outlineVariant,
              );
            }),
            const SizedBox(width: 4),
            Text(
              '($reviews)',
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.tertiary,
              ),
            ),
          ],
        ),
        const Spacer(),
        // Price
        Text(
          price,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryContainer,
          ),
        ),
      ],
    );
  }

}
