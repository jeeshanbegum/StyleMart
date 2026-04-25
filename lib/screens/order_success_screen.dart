import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.onSurface),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false),
        ),
        title: Text(
          'StyleMart',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        actions: const [
          SizedBox(width: 48), // Spacer to balance the close button
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Success State Visual
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline,
                size: 64,
                color: AppColors.primaryContainer,
              ),
            ),
            const SizedBox(height: 32),
            
            // Success Messaging
            Text(
              'Order Placed\nSuccessfully!',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: AppColors.tertiary,
                  height: 1.6,
                ),
                children: const [
                  TextSpan(text: 'Thank you for your purchase. Your order '),
                  TextSpan(
                    text: '#STM-8824',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                  TextSpan(text: ' is being processed and will be with you soon.'),
                ],
              ),
            ),
            const SizedBox(height: 48),
            
            // Summary Section
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  // Delivery Est
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.local_shipping_outlined,
                      color: AppColors.onSecondaryFixed,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DELIVERY EST',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            color: AppColors.tertiary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '3-5 Business Days',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Divider
                  Container(
                    height: 32,
                    width: 1,
                    color: AppColors.outlineVariant.withOpacity(0.3),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  // Order Total
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'ORDER TOTAL',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          color: AppColors.tertiary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '\$230.00',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.onSecondaryFixed,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Contextual Editorial Card
            Container(
              height: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.saturation,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDprN0_hKO4x2CI063azktUQNhdyDcuM8b7tgqZzahQKOq8ON81RGmWU9wWtW3Tq58quJauRQ4ypls6tGrFNqnvPPaeOJq8uNiHvuER75tpgSiRzYHe3fh62QHRSQjUBBgX4R1f1xQabntnkImXukxcgYxShh3viEc4d6nOJmqQ1H4BfKL_JBny7BYL43KLoDcUCqdQ-zp0RPCq0cuT1pS6JsfGAHWqUbH4bNZXwz7cTS_k6OeN8YlbS2zTu81Cw5f3dzfJKUVMFg',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(color: AppColors.surfaceContainerHigh),
                      errorWidget: (context, url, error) => Container(color: AppColors.surfaceContainerHigh),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.onSecondaryFixed.withOpacity(0.5),
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: SizedBox(
                        width: 160,
                        child: Text(
                          'Curating your next masterpiece.',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            
            // Primary Actions
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/track_order');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.onSecondaryFixed,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'TRACK ORDER',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.onSecondaryFixed,
                  side: const BorderSide(color: AppColors.onSecondaryFixed),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                child: Text(
                  'CONTINUE SHOPPING',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            // Support Link
            Text(
              'NEED HELP? CONTACT ATELIER SUPPORT',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0, // 0.2em approx
                color: AppColors.tertiary,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
