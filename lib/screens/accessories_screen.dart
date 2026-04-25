import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/category_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/product_card.dart';

class AccessoriesScreen extends StatelessWidget {
  const AccessoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CategoryAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero
            const HeroSection(
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBRThqk0GlgGQAlpHN8TaqgZP_ols8xTKtz-LKik5mZ5AdjO5WC8_7R35OKdn8t2rR28Oq5eJHa16uYAKKLQjAvK5Ocy_BqegIW4tNPDj6iDaV3s4qu61VuPItP3lwgKX4QxF7h2q21ru8DjlYFUwkVjJM5A5YQyVrENbKxKAmXPAwHgiEOV9_TmHC90C1ZdAIf4LWWDIB0Hb2ncuOhRoxSy8fTHsQEtuN45j5GcVqNL4a_Fuv0WsR_phc7jQrEpxQa2sgP-6F1Rw',
              title: 'The\nAccessories Edit',
              label: 'Curated Series',
              height: 460,
            ),
            const SizedBox(height: 32),
            // Product Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 32,
                childAspectRatio: 0.50,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDcVVaHDO6vTi_12WzOH3tXr3z27_QFm204zumZSves93-n2FqSqsK3xjhMJIDXdjNYLHC74LYgQmOAubQTQyDGAiAZodVp5hS7cAEAPdApoDzAEXxXxf0SfjHCXAJyK_4f71rUHIZ_Pw9dj2UvwA-t112Zxgsx5bG_HllNSVvKIn0WXlDANb4OvpL184yP_nWyG1xvVsL5g4OXrj2ZxbdJ9hsB2FuxB_e1ifACCjnBOzQcpeJNzMC1Ldt87FeLdWwFp758jnlpgQ',
                    name: 'Leather Wallet',
                    price: '\$85.00',
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDV_ksucK0-JW0y-AyR_It8JF5b-iX9iAYi6jloZLza5gUPwmy2P91MYuLDVBVKhBPKDVUKi1QtiAnX4Tl6ALRM3FdVQT4sGaoKbQGjCl40ClukYaWmKEb8h4u-pLUYdK4LzqlIhbSC-WoKVlnbIh0qgHGPinbwul6uplJ0-jrIXOeSLOR-Z1sdikvNs9FtT1QH5TL4KsRNIXqCj1ASDaX5cGPvdEDBScvXfhzRFQW2uDtP48-G9GWTF23lXP7tprTSASvnR2ol1A',
                    name: 'Classic Sunglasses',
                    price: '\$120.00',
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB_4C_Ks_qUAABJNIUQsU0PTV9z4-Wx5P6NUXjhohBpxUDZUqwBDkQCJXsZl8gFS1wxJxiIumXgRSzP959-AaSoNNIeEjRpfowFdWIQmac0xnnf90M5iy-AlM0GweC2ftuVhqKNXR6HiARk1ACRZqUUvCTMnvCNXq2DpsLW3xX4KFhpr1__qE2Z2rfgYeL10uUMy95-vU5zmGNwZD7YT_6ZhXNSjlv-sHzA_Nex3uj_wStx_7WVbDVOlp0kY74Qkic1Cb8Y8RPxMA',
                    name: 'Silk Scarf',
                    price: '\$65.00',
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC3Ppfxvz5tPfuZwEVz3zD4FTD_1oWL4FpPlxU5tHgIga8hXrVvi2zoisrTMNchRh2DqTVFm_AGKaZ37_vyexIQkbrXgcCiSKCD0pv0ieh7lsxYXhqRFeU1m_xYi4IZgfsIdPJsXX3RNcQEkeY6j4l25B4muFimnWCmISFBfZaqRG983OkfIkD143C2qOn3PpyDvajH4oqLwR8dN2mfVeN-twd05VVlIkV_Qe-FOZaNmELuuA9lLR_VVeZjIm3KPc9NCV9pOOsskg',
                    name: 'Minimalist Belt',
                    price: '\$75.00',
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

}
