import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/category_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/product_card.dart';

class HandbagsScreen extends StatelessWidget {
  const HandbagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CategoryAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero
            HeroSection(
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBfmZbumHskw1d8jaLgPxx2_w-4Tms-6i9mr0M3cr2DENa5GzoV0kZnUHXeKFWGwde3X4Lxw86t4kKMYWSldUIJoS1KgDDl3g-1j5Qg1HdR225Q9u96tVWRNliuEMFgVnKs5aniti5sLKnAv-gMATyHre_or0G6b-f3Hw5o4ZU6VzGTUkgW8iX6B65BiGicRnOGqzJ6_qePYqwcMksNPlDNr-9QR-nl88971LnqyJ9HzwWJqrZi_QVDGnLq_8ZkF2qY4fBEBSZjAg',
              title: 'The Handbag Edit',
              subtitle: 'CURATED CRAFTSMANSHIP & TIMELESS DESIGN',
              height: 530,
            ),
            const SizedBox(height: 24),
            // Product Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 32,
                childAspectRatio: 0.50,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildHandbagCard(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBkAjGMPyWYWYdQy65DdbxCJKSTPkdxlco3lrKlGlr8oFdVArGCvtSedJJsi1--UDZ0yoUea6e_zP-ZuYEmj4VKXB6ls5qHfjKOJS-ibCtYmO-J5yMGbrBj96RTbgkv4bjDWcnIa0ou3nCw3Sra069nYFa3Ak7bziD49CKdWUISqNr9L0yqxKqWWPyW7-YxFqwzbbLMNG0YEXo93zOLl5uiCONbkRAkczf-V6JXZRIP0xKrnryRlXg7Oa6gJipsZwyjMmQvp6hlkQ',
                    'STRUCTURED TOTE',
                    '\$850',
                  ),
                  _buildHandbagCard(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCLWjbJwgtgdQwvfy3YhCfg-HQbNE1bz4b8eYMjUqta7Szf1N_YPU8ptlg_ZLoqEnQDbaSu0A8W1m80spJ__BCUUWvwcGE-t_nXQN74wVxK7KaSD9Gv6_DMS5uxzFA1W1B5xN-2R9B8j8mRacq-d9grmDHc3vAmxZLhftpXUY4hXENj9EfE022LF-Klx1jpcSI42X9UX3XerlGyqG4Vuej2nMtWNfyauAojdr0-Dv9Ut2KdAa7LthbstCMv-2OTM9MmZyn08E9NOg',
                    'CROSSBODY',
                    '\$420',
                  ),
                  _buildHandbagCard(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBkbIjewKWtM8QGO9vFsnmXGp7WhKUcWY6GF0T0VF8N8AzfYCCr6A7RZZUkxO3dIBGJpNETM3uh2jIRtb7SbYnPZhckdAUIZAnW1Ls04sL0HAk7gqSWaD4KV9tlxcnAz0hU_Tmf4UWkXxvXdk8mMB7BRpJQFfSzuj3F8m3mW7cqNPxy01UjMxwlb6uTDbPF4K1Ts9mkng6OcW3h8-Y5Hr5jhXAu737t1mLOg18ds9kUHAjsGpYJz7rRo_Ufaf8v20YQ0rh2ErTMPQ',
                    'EVENING CLUTCH',
                    '\$310',
                  ),
                  _buildHandbagCard(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuA2CJ9djBMTV2NAeJZObnTzTAFB4b73gYmnTVQFdOt-YXQbgeCp-hsb_v6sHfOZc5jzjrPcCFeqHksuDIQftLA0oPgjqUgKjpIM3xHSKr8U_CepO1Hjng8ls7NXg5zKQI4Lyx8bXPk_65GGnekcZebAwDuUJTT1zRN8mj7n6fAjyBfVxlcso3WoMbmQJ4nLV8bgimL9TIRlVangReSYzhWylt6GgPjrnTUsUcNw6q76_Tf1nhNcaH8WYnVWjSZbgt-XRUvN5RiWwg',
                    'LEATHER SATCHEL',
                    '\$590',
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

  Widget _buildHandbagCard(String imageUrl, String name, String price) {
    return ProductCard(
      imageUrl: imageUrl,
      name: name,
      price: price,
    );
  }
}
