import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryContainer),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Track Order',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A2E), // onSecondaryFixed
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.tertiary),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildOrderIdentity(),
            const SizedBox(height: 32),
            _buildMapVisualization(),
            const SizedBox(height: 48),
            _buildProgressTimeline(),
            const SizedBox(height: 40),
            _buildShippingDetails(),
            const SizedBox(height: 40),
            _buildShipmentItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderIdentity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ORDER ID',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
            color: AppColors.tertiary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '#STM-8824',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.onSecondaryFixed,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Estimated delivery by 6:00 PM today',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.tertiary,
          ),
        ),
      ],
    );
  }

  Widget _buildMapVisualization() {
    return Container(
      height: 256,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 60,
            offset: const Offset(0, 40),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Map Image
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.saturation,
            ),
            child: Opacity(
              opacity: 0.8,
              child: CachedNetworkImage(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBMUecgrI9y0TP6ieEkcog1Icjk2p51ftiFYvvPMg_vPv5A8EKo5TQLfBGHCBB-46o_PvJgVAHk80M3tbcW0vi0LVM1yFkA3If661Yvj104ZzqaJu8EHqaiKF03mF4jHpL8YwBE0QvfelfmQPgXonl-jx18CA3bg6BXmOfnW0fn-03MPL9AmHdbhpS-YtjP72mdM6JNNrGTzID4ybm0l7M8IFBEEMVFCmuW4nUAcREI8yWlHE7gemDzD2Ha7JgfKW1Z0pTSkE2SyA',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: AppColors.surfaceContainerHigh),
                errorWidget: (context, url, error) => Container(color: AppColors.surfaceContainerHigh),
              ),
            ),
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.surfaceContainerHighest.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Floating UI
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.onSecondaryFixed,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.local_shipping_outlined, color: AppColors.surface, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'COURIER',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                              color: AppColors.tertiary,
                            ),
                          ),
                          Text(
                            'StyleMart Express',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onSecondaryFixed,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.call_outlined, color: AppColors.onPrimaryFixed, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressTimeline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'DELIVERY PROGRESS',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0,
              color: AppColors.tertiary,
            ),
          ),
        ),
        const SizedBox(height: 32),
        // Step 1: Placed
        _buildTimelineStep(
          title: 'Order Placed',
          subtitle: 'Oct 20, 10:45 AM',
          description: 'Your order has been confirmed and is being prepared at our atelier.',
          isActive: false,
          isCompleted: true,
          isLast: false,
        ),
        // Step 2: Shipped
        _buildTimelineStep(
          title: 'Shipped',
          subtitle: 'Oct 21, 02:15 PM',
          description: 'Package departed from our London distribution center.',
          isActive: false,
          isCompleted: true,
          isLast: false,
        ),
        // Step 3: Out for Delivery (Active)
        _buildTimelineStep(
          title: 'Out for Delivery',
          subtitle: 'Oct 24, 08:30 AM',
          description: 'Your courier is currently 1.2 miles away in Mayfair.',
          isActive: true,
          isCompleted: false,
          isLast: false,
        ),
        // Step 4: Pending
        _buildTimelineStep(
          title: 'Estimated Delivery',
          subtitle: 'Pending',
          description: null,
          isActive: false,
          isCompleted: false,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildTimelineStep({
    required String title,
    required String subtitle,
    String? description,
    required bool isActive,
    required bool isCompleted,
    required bool isLast,
  }) {
    Color nodeColor = AppColors.surfaceContainerHighest;
    Color lineColor = AppColors.surfaceContainerHighest;
    Color titleColor = AppColors.tertiary.withOpacity(0.4);
    Color subtitleColor = AppColors.tertiary.withOpacity(0.4);
    Color descColor = AppColors.tertiary.withOpacity(0.4);

    if (isCompleted) {
      nodeColor = AppColors.primaryContainer;
      lineColor = AppColors.primaryContainer.withOpacity(0.2);
      titleColor = AppColors.onSecondaryFixed;
      subtitleColor = AppColors.tertiary;
      descColor = AppColors.tertiary;
    } else if (isActive) {
      nodeColor = AppColors.primaryContainer;
      titleColor = AppColors.primary;
      subtitleColor = AppColors.primary;
      descColor = AppColors.onSurface;
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Node & Line
          SizedBox(
            width: 40,
            child: Stack(
              children: [
                if (!isLast)
                  Positioned(
                    left: 11, // half of 8 + 7 = 11 to center the 2px line
                    top: 8,
                    bottom: 0,
                    child: Container(
                      width: 2,
                      color: lineColor,
                    ),
                  ),
                Positioned(
                  left: 4,
                  top: 4,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: nodeColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isCompleted
                            ? AppColors.primaryContainer.withOpacity(0.2)
                            : (isActive ? AppColors.primaryContainer.withOpacity(0.1) : Colors.transparent),
                        width: isCompleted ? 4 : (isActive ? 4 : 0), // Simulate the ring effect
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                          color: subtitleColor,
                        ),
                      ),
                    ],
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: descColor,
                        height: 1.6,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShippingDetails() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SHIPPING ADDRESS',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: AppColors.tertiary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined, color: AppColors.primaryContainer),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Julianne Sterling',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSecondaryFixed,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '24 Savile Row, Mayfair\nLondon, W1S 3PR',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppColors.tertiary,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShipmentItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'SHIPMENT CONTENT',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: AppColors.tertiary,
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Item 1
        _buildShipmentItem(
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA7zE2xwa8gfwAVZUQU4hiQ_7cgu8xRURjZ0VAAjJnyytGOEUOmqEwj3rSPXTC-ZudZP7LlETYkUvzQyPoSLMRYxNA8Dog5mB8BkEZ6BW0iE0U_QV-jskBFZf8GjpsrErv151vs2AqxVimk6DaMueYulBgMzOwvyK7CoSTe_00zNIjtzhMCpBbYjHBsxXqGJOW6fgEQzi9Piy5m2bh6hFgJRr_-wHEynz0qmpaYyKhzmZB-ZsBGQsZ-jJwV4nTRGg1vypcYVKjUUA',
          title: 'Classic White T-Shirt',
          details: 'Size: M | Qty: 1',
          price: '\$85.00',
        ),
        const SizedBox(height: 24),
        // Item 2
        _buildShipmentItem(
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCtx8MvwvoOLHxM795u29j4alnkd1Z8pZoO4nu3TjTHevnjY496Huf8Mf7aYACpmE0rAn4Vo9IUDdfBUfMrTxsE7KDu4qj8r09xYZnM3bWRW4B8_d6oYOGyvLN5Z9l0rVCdMFue23w4VQQuq3qlzyZC8l33EhPrKCTeZoFzojeYHN74st88hwS_87VLmx5KGWGXPXb5KoCzmKvbB7mw0EaBPAokxJIpcHubs5p0q-XV6iaPPmvQe8Uywnm5epMOFWvMWP5wfwRwsQ',
          title: 'Straight Cut Raw Denim',
          details: 'Size: 32 | Qty: 1',
          price: '\$145.00',
        ),
        const SizedBox(height: 32),
        // Total
        Container(
          padding: const EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.surfaceContainerHighest.withOpacity(0.5)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Total',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.tertiary,
                ),
              ),
              Text(
                '\$230.00',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSecondaryFixed,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShipmentItem({
    required String imageUrl,
    required String title,
    required String details,
    required String price,
  }) {
    return Row(
      children: [
        Container(
          width: 64,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => const SizedBox(),
            errorWidget: (context, url, error) => const SizedBox(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSecondaryFixed,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                details,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.tertiary,
                ),
              ),
            ],
          ),
        ),
        Text(
          price,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.onSecondaryFixed,
          ),
        ),
      ],
    );
  }

}
