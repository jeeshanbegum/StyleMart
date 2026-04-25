import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/bottom_nav_bar.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // Dummy data to show populated state. When empty, it shows empty state.
  List<Map<String, String>> wishlistItems = [
    {
      'id': '1',
      'name': 'Structured Tote',
      'price': '\$850',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBkAjGMPyWYWYdQy65DdbxCJKSTPkdxlco3lrKlGlr8oFdVArGCvtSedJJsi1--UDZ0yoUea6e_zP-ZuYEmj4VKXB6ls5qHfjKOJS-ibCtYmO-J5yMGbrBj96RTbgkv4bjDWcnIa0ou3nCw3Sra069nYFa3Ak7bziD49CKdWUISqNr9L0yqxKqWWPyW7-YxFqwzbbLMNG0YEXo93zOLl5uiCONbkRAkczf-V6JXZRIP0xKrnryRlXg7Oa6gJipsZwyjMmQvp6hlkQ',
    },
    {
      'id': '2',
      'name': 'Silk Scarf',
      'price': '\$65.00',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB_4C_Ks_qUAABJNIUQsU0PTV9z4-Wx5P6NUXjhohBpxUDZUqwBDkQCJXsZl8gFS1wxJxiIumXgRSzP959-AaSoNNIeEjRpfowFdWIQmac0xnnf90M5iy-AlM0GweC2ftuVhqKNXR6HiARk1ACRZqUUvCTMnvCNXq2DpsLW3xX4KFhpr1__qE2Z2rfgYeL10uUMy95-vU5zmGNwZD7YT_6ZhXNSjlv-sHzA_Nex3uj_wStx_7WVbDVOlp0kY74Qkic1Cb8Y8RPxMA',
    },
    {
      'id': '3',
      'name': 'Minimalist Gold',
      'price': '\$620',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAwQlsYDPilMCDOW8eXFeAod7L8UptqcuIrvGuYqNovc7O8QmQPZra9PmRhllJueQkeI_N8qQiRVNVinGKtmQCTPovrF6foQZVQbGF8zxzvGo-jr3N01C6QyH7EZ5E9g-LZJijZYk2VEUWtzL9YwAqSz292Ng-Dow-OHf3Q-NakTRLsyVD5vVy9MNWjd6g6EDQ8uB-CLKKHQQSouTg-hob_L_XxXJ476v0M6x55qf-E_qqPFFG3GTxaW3UOOj0aZuRfWAmATO0Ysw',
    },
  ];

  void _removeItem(String id) {
    setState(() {
      wishlistItems.removeWhere((item) => item['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Off-white for contrast against white cards
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: GoogleFonts.inter(
            color: const Color(0xFF1A1A1A),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false, // No back arrow
      ),
      body: wishlistItems.isEmpty ? _buildEmptyState() : _buildGrid(),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_outline,
              size: 80,
              color: Color(0xFFEEEEEE),
            ),
            const SizedBox(height: 24),
            Text(
              'Your Wishlist is Empty',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Save items you love by tapping the heart icon',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF757575),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/shop');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A2E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Start Shopping',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.65,
      ),
      itemCount: wishlistItems.length,
      itemBuilder: (context, index) {
        final item = wishlistItems[index];
        return _buildProductCard(item);
      },
    );
  }

  Widget _buildProductCard(Map<String, String> item) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image and Heart Icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: item['image']!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(color: const Color(0xFFEEEEEE)),
                  errorWidget: (context, url, error) => Container(color: const Color(0xFFEEEEEE)),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => _removeItem(item['id']!),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['price']!,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFC9A84C),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add to cart logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${item['name']} added to cart')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A1A2E),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
