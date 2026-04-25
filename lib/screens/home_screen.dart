import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Top App Bar
            SliverToBoxAdapter(child: _buildHeader(context)),
            // Search Bar
            SliverToBoxAdapter(child: _buildSearchBar()),
            // Promo Banner
            SliverToBoxAdapter(child: _buildPromoBanner()),
            // Category Chips
            SliverToBoxAdapter(child: _buildCategoryChips()),
            // Featured Section Header
            SliverToBoxAdapter(child: _buildFeaturedHeader()),
            // Product Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 32,
                  childAspectRatio: 0.50,
                ),
                delegate: SliverChildListDelegate(_buildProductCards()),
              ),
            ),
            // Divider
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0EDED).withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        currentIndex: 0,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, User 👋',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.tertiary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Find your style',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                  color: AppColors.darkNavy,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _iconButton(Icons.notifications_outlined, AppColors.onSurface),
              const SizedBox(width: 8),
              _iconButton(Icons.shopping_bag_outlined, AppColors.gold, onPressed: () {
                Navigator.pushNamed(context, '/cart');
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, Color color, {VoidCallback? onPressed}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: 24),
        onPressed: onPressed ?? () {},
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for products, brands...',
          hintStyle: GoogleFonts.inter(color: AppColors.tertiary, fontSize: 14),
          prefixIcon: const Icon(Icons.search, color: AppColors.tertiary),
          filled: true,
          fillColor: AppColors.surfaceContainer,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(999),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(999),
            borderSide: const BorderSide(color: AppColors.gold, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDeAasAlZX_Dl2ZAk1dYH5BGDm0IgPoxezwl4oMxi_trmDAA3q59SMieT3MyQBT6K3rO7ABb3-xpO_SF7jz9BaYGhnNw_YXgjYAUoBO9Yg8GLWcyoLME-IBPclFGPMVxtVgYat6z3le6QMLjkWgqMFCfEfJMjOAgQZOpJ41O1SnFeAFaSjt0vlvF_fpf8RFSVam4xPH9Jc01IIknPUc6TQkLjm4EENiL_ipSbXc8PkKOvsbm6AIZnhUhFuMLYyRg2rqfoNnS5-hhw',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: AppColors.surfaceContainer),
                errorWidget: (context, url, error) => Container(color: AppColors.surfaceContainer),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.onSecondaryFixed.withValues(alpha: 0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 0,
                bottom: 0,
                right: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'NEW ARRIVALS 🔥',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                          color: AppColors.onPrimaryFixed,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'The Summer Editorial Collection',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ['All', 'Men', 'Women', 'Accessories', 'Footwear', 'Jewelry'];
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 44,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final isActive = index == 0;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? AppColors.onSecondaryFixed : AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                categories[index],
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isActive ? Colors.white : AppColors.tertiary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CURATED FOR YOU',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: AppColors.gold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Featured Styles',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.onSecondaryFixed,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildProductCards() {
    final products = [
      {
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAEaqxiPBYOgQMApM4uflEzlD-6AVzCq6G8xLPcu8XdDoQoLt2VKRKFMGlYFJ7JT-NcjoSBvjrdZU0xxZFeWqL8UCAVt-CFSqfaujlFVcIf20yz9Bvq8ZXNeaRQCI-pn7PtyVvC-Rjt1fCYJu9ZFyZOv6gwoFjBhx-a55EMOvsuHJwUm3texj2I8x8BgAEVYinU5rKyTG6SY9cPimFPfiDkiHYOOtr38iKPCAzZPcRidrUEs21vdQ28Ma9wgTYOMfnHOfapQjlvlQ',
        'name': 'Linen Blend Overcoat',
        'price': '\$189.00',
        'category': 'Modern Classic',
      },
      {
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAwJBoiViaOHO9RZRjmAa3jYF_LNhK4nNtBQmRlpGxpKPNMsngdO7_94z9s8GUHAOLBRxq7eeE27zv41_CcQuQDyLMIX0YSEzP2YoWMUwiPsWsy4m6Ut2W8CK8XHPCbU2amGBirWdOg7PfML2v2ZrACYvQGThxLSGIkPJYroc7PKtxr5kwm_8Gej2DUwRjqPDu2rccMVe4fdWTyWiKCpDhzNtPdeOFQwINfhMw002DpoRUE_s9-cLzM2KjYugKS6gdEsCzzTeLMgQ',
        'name': 'Structured Wool Knit',
        'price': '\$120.00',
        'category': 'Essential',
      },
      {
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAeH7aA5L44lqeaTja_IIh0ZvfEtm2vIh3sEat2d5OYCi8TV_R4xHdQPSwxk6-0yfr_UuGUBd4cSbjeU81jiJi0CQY5AbWgDyAT9M6o5wzuCku1QUH89LLYrdehqWz5Z-x5VjJCf1Mb4KdOo_miLXGSThsQlNJ8529yMTgGIpaCvIP2nSHOXb9krEjbjuBvPjgMnFpaFVmEp2X07CmTAVz_ZR66jxxmkAAPBjUGdSjYD3gYZK7qOic9Wn-yudYTEVi-EtNNu5VfLA',
        'name': 'Pebbled Leather Tote',
        'price': '\$345.00',
        'category': 'Accessories',
      },
      {
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBygQaJgJqVBLi6kIYb4KguUftNqAWQ_a1hwNJtrvQWRo2GqRUJd8DkSAst38Eng5EuRUuuZ7oXVm1bE4_HzGdBXQBBXkImeiLydgTRX35F5ee6MOPKfCUV2Nn9HYRJSrfCa5kdYuWVbiCY5LxvNIlr6ZwEyOjG8j05Qs975lPprT1mhi6UQWIvDb5FZu2WZ-X5FK2NRVOyGtpRlA07d4ve-0HxFOm48mqbbs2p4k7eqrS5VtgjkekOZgiYUjoyNl2Ee5lp3YtHhQ',
        'name': 'Technical Bomber Jacket',
        'price': '\$210.00',
        'category': 'Outerwear',
      },
    ];

    return products
        .map((p) => ProductCard(
              imageUrl: p['image']!,
              name: p['name']!,
              price: p['price']!,
              category: p['category'],
              showFavorite: true,
            ))
        .toList();
  }

}
