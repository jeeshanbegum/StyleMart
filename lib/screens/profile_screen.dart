import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primaryContainer),
          onPressed: () {},
        ),
        title: Text(
          'StyleMart',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A2E), // onSecondaryFixed
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.primaryContainer),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProfileHeaderCard(),
            const SizedBox(height: 32),
            _buildStatsRow(),
            const SizedBox(height: 40),
            _buildMenuList(),
            const SizedBox(height: 32),
            _buildLogoutButton(),
            const SizedBox(height: 80), // bottom nav spacing
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }

  Widget _buildProfileHeaderCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A1A2E), // onSecondaryFixed
            Color(0xFFC9A84C), // primaryContainer
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A2E).withOpacity(0.15),
            blurRadius: 50,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Decorative Circle
          Positioned(
            right: -48,
            bottom: -48,
            child: Container(
              width: 192,
              height: 192,
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: BackdropFilter(
                filter: ColorFilter.mode(Colors.black.withOpacity(0), BlendMode.srcOver), // Simple blur effect achieved via opacity above. For real blur use ImageFilter
                child: const SizedBox(),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryContainer.withOpacity(0.3),
                        width: 4,
                      ),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAe-nOZes88l_CU5iupiey9cbZwEBysjjX0-CeutsFaUswP23xWHcXLcgQ7PAwymZ_Gp8_xLVuiRTroyLV9sx4tYaJG_Tu9sJ_uqwkAf4v2GcSc7zk4XCG_N3x6Kpce92tdH9ZlwEck1oyqSug9BxT49Q_D7rftXwp5R6ChV0gUD_ozN_jmFN2W9ijXWScv7N1zCk4uoW4cBeGGJZKPGEcx-7Kjjxm8WY3LQic2bFu142-4WyGK7imZ78C9gtWLCDwckjqRDt3TRA',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(color: Colors.white24),
                        errorWidget: (context, url, error) => Container(color: Colors.white24),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Julian Thorne',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'julian.thorne@atelier.com',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.7),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(child: _buildStatCard('12', 'Orders')),
        const SizedBox(width: 16),
        Expanded(child: _buildStatCard('24', 'Wishlist')),
        const SizedBox(width: 16),
        Expanded(child: _buildStatCard('8', 'Reviews')),
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.onSecondaryFixed,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: AppColors.tertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMenuSectionTitle('Account Settings'),
        _buildMenuItem(Icons.receipt_long_outlined, 'My Orders'),
        _buildMenuItem(Icons.location_on_outlined, 'Addresses'),
        _buildMenuItem(Icons.payments_outlined, 'Payment Methods'),
        _buildMenuItem(Icons.notifications_outlined, 'Notifications'),
        
        const SizedBox(height: 24),
        _buildMenuSectionTitle('Support & Info'),
        _buildMenuItem(Icons.help_outline, 'Support'),
        _buildMenuItem(Icons.info_outline, 'About StyleMart'),
      ],
    );
  }

  Widget _buildMenuSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 16),
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: AppColors.tertiary,
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.onSecondaryFixed, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.onSurface,
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.tertiary, size: 20),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        icon: const Icon(Icons.logout),
        label: const Text('Logout'),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.error,
          side: BorderSide(color: AppColors.error.withOpacity(0.2), width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}
