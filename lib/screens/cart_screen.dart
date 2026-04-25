import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_nav_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Mock cart data
  final List<Map<String, dynamic>> _cartItems = [
    {
      'id': '1',
      'title': 'Classic White T-Shirt',
      'size': 'M',
      'price': 45.00,
      'quantity': 1,
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuA_yOthqGJT8INnQrE7aD3S615X7-mL5GbEIOEMnVRNO0uBF628G9q2KvqWmW-f6tVdtP--3i_TFZPumLO4i_HGlkA5oFJbx0ZXlTNhRvsUdA_xiPFrPXjZXO4gBlzf_mDKsc5pWkSUp-Rckz6kw1uqQBg7RVQStL_brulnRlJKAgSi4XvQsAG4VsdBVGWH3UFEugDLUQgNoS4tgOr38RKzLEfx8OL84w5LGFEgUWBbYfkmMr3kJhGpHbFpYJz18sVJgCOsXWHp-g',
    },
    {
      'id': '2',
      'title': 'Premium Loafers',
      'size': '42',
      'price': 185.00,
      'quantity': 1,
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCD_0oJ6NB3i5nH5K-8vxsxasRqAp1P43YskmyyElNEps0e8cEKR3UN0fxIswtFPHjtfmwqnRpqaTbmRj2T2edlfA0pc2dgWBD8jz3w7QyLhF-HQTPoyvGMbdvRQ65vVmg-ISU8VaLqjfIOF5VElBMuGOuAPg5qMKI91CWWo2PbLv55DJOQyz7GOJO1v2q6J3RYZvG-BiMYdp7Z5g7H-GHEoWJd5tWeFdvU6rhC0yF6F2UUFIvkvAHuEEWQOb-zr4zfmXv2ysn7Yg',
    },
  ];

  void _incrementQuantity(int index) {
    setState(() {
      _cartItems[index]['quantity'] = (_cartItems[index]['quantity'] as int) + 1;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      final currentQuantity = _cartItems[index]['quantity'] as int;
      if (currentQuantity > 1) {
        _cartItems[index]['quantity'] = currentQuantity - 1;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  double get _subtotal {
    return _cartItems.fold(0, (sum, item) => sum + ((item['price'] as double) * (item['quantity'] as int)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false, // No back arrow for navbar screens
        title: Text(
          'My Cart',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.onSurface,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.primaryContainer),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 280), // Extra bottom padding for fixed summary
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ..._cartItems.asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: _buildCartItem(entry.key, entry.value),
                  );
                }),
                
                // Promotional Banner
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primaryContainer.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.loyalty_outlined,
                        color: AppColors.primaryContainer,
                        size: 28,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Complimentary Shipping',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Applied automatically to your order.',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: AppColors.tertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Fixed Bottom Order Summary
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildOrderSummary(),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildCartItem(int index, Map<String, dynamic> item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: CachedNetworkImage(
            imageUrl: item['image'],
            fit: BoxFit.cover,
            placeholder: (context, url) => const SizedBox(),
            errorWidget: (context, url, error) => const SizedBox(),
          ),
        ),
        const SizedBox(width: 20),
        
        // Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Delete
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item['title'],
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSecondaryFixed,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _removeItem(index),
                    child: const Icon(
                      Icons.delete_outline,
                      size: 20,
                      color: AppColors.tertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              // Size
              Text(
                'SIZE: ${item['size']}',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                  color: AppColors.tertiary,
                ),
              ),
              const SizedBox(height: 16), // Spacer to push price/qty down
              
              // Price and Quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${(item['price'] as double).toStringAsFixed(2)}',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurface,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => _decrementQuantity(index),
                          child: const Icon(Icons.remove, size: 18, color: AppColors.onSurfaceVariant),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '${item['quantity']}',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onSurface,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => _incrementQuantity(index),
                          child: const Icon(Icons.add, size: 18, color: AppColors.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 48),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.9),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 40,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Subtotal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.tertiary,
                  ),
                ),
                Text(
                  '\$${_subtotal.toStringAsFixed(2)}',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Delivery
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.tertiary,
                  ),
                ),
                Text(
                  'FREE',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: AppColors.primaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Divider
            Divider(color: AppColors.surfaceVariant.withOpacity(0.5), height: 1),
            const SizedBox(height: 16),
            
            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSecondaryFixed,
                  ),
                ),
                Text(
                  '\$${_subtotal.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSecondaryFixed,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Checkout Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.onSecondaryFixed,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  elevation: 8,
                  shadowColor: AppColors.onSecondaryFixed.withOpacity(0.2),
                ),
                child: Text(
                  'CHECKOUT',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0, // 0.1em approx
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
