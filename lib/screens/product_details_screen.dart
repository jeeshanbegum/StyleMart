import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String _selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120), // Space for bottom bar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeroImage(),
                _buildProductInfo(),
              ],
            ),
          ),
          
          // Top Navigation (Floating)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFloatingButton(
                      icon: Icons.arrow_back_ios_new,
                      onTap: () => Navigator.pop(context),
                    ),
                    _buildFloatingButton(
                      icon: Icons.favorite_border,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Fixed Action Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomActionBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.surface.withOpacity(0.8),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: AppColors.onSurface, size: 20),
      ),
    );
  }

  Widget _buildHeroImage() {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 3 / 4,
          child: CachedNetworkImage(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCyUxlBEyMISD_EB6I5nQOjKN8ScyFQnwrwSSpilYDITbXSEyb0nW1cXo-FTYBCdmqG2bu_tZz4-JCFYcGuXBef9b7Snl_GQw1Fd639CPLI3fdK9yohQYz6oRysar8nClb2OUjXPMnPgF_WnjtmAW9YoXfNDDkYVyO1RIdZp8a0feQDaeT-fkLYmlGjXwPKf9bt8-bbYvS1ldP113KI3RDgmmoBzl3bWEhesLDL-GLc52R2QmkI_VVXOiWthJg144yeB3VnI5hLjQ',
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: AppColors.surfaceContainerHigh),
            errorWidget: (context, url, error) => Container(color: AppColors.surfaceContainerHigh),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 128,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.surface,
                  AppColors.surface.withOpacity(0.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Transform.translate(
        offset: const Offset(0, -32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header & Price
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Classic White T-Shirt',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors.onSecondaryFixed,
                      height: 1.1,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '\$45.00',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Ratings
            Row(
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return const Icon(
                      Icons.star,
                      size: 18,
                      color: AppColors.primaryContainer,
                    );
                  }),
                ),
                const SizedBox(width: 8),
                Text(
                  '124 REVIEWS',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0, // 0.1em approx
                    color: AppColors.tertiary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Description
            Text(
              'Crafted from ultra-premium heavyweight cotton, our Signature Tee offers a structured yet breathable silhouette. Responsibly sourced and ethically manufactured.',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.onSurfaceVariant,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 32),

            // Size Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'SELECT SIZE',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0,
                    color: AppColors.onSecondaryFixed,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.primaryContainer.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    'SIZE GUIDE',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: AppColors.primaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: ['S', 'M', 'L', 'XL'].map((size) {
                final isSelected = size == _selectedSize;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSize = size;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: size == 'XL' ? 0 : 12),
                      height: 64, // aspect square roughly
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.onSecondaryFixed : Colors.transparent,
                        border: Border.all(
                          color: isSelected ? AppColors.onSecondaryFixed : AppColors.outlineVariant.withOpacity(0.3),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColors.onSecondaryFixed.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        size,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : AppColors.onSurface,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.9),
        border: Border(
          top: BorderSide(color: AppColors.outlineVariant.withOpacity(0.1)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.onSecondaryFixed,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  shadowColor: AppColors.onSecondaryFixed.withOpacity(0.3),
                ),
                child: Text(
                  'ADD TO CART',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0, // 0.15em tracking approx
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColors.onSecondaryFixed,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
