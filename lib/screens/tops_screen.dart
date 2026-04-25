import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/category_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/product_card.dart';

class TopsScreen extends StatelessWidget {
  const TopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CategoryAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero
            const HeroSection(
              imageUrl: 'https://lh3.googleusercontent.com/aida/ADBb0uhUg_dgppn9eHyUg9GpQgzlX8vQucPxvSWH5x-lk06dsiKg-ZPaaZ_oZVUsun8l2IZ12573wz6ZJx9TUkPso950FPcoTHXichFNJzxh0qAnynkvuxhVGuswJUN_oCdxp2DffAXY8inzHzGEhf7IKdSR9O_G9TnKASqTXa3rtXj1NAliWO_NYNF17qx8iVy5XU-7L_zV-5SToVRfYGuVJZzyXGys2Z3YflTUrqSwk9e5PC0fIHzNs4fo6UiFo4GqWfTaMQfT-MF3',
              title: 'The Tops Edit',
              label: 'New Collection',
              subtitle: 'Curated essentials for every occasion.',
              height: 450,
            ),
            // Category heading
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Curated Selection',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onSecondaryFixed,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Refined styles for your wardrobe.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.tertiary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
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
                    imageUrl: 'https://lh3.googleusercontent.com/aida/ADBb0uhGSXviBOvKl1WQYnxzN9_wrL16GN6uxdELnKHKaERxMkBtxDs1drQSu4c1nbL9Fv-4_THxPZ7xVynMsaq1ei40jHlvwxZBU5SLVWPjanNp1SR_zIhDZisq43W2NjLn3EBJvnVyFI-u0En4TkKpL-h_DccOTPoJMjmTX8ewEEfSx29NNIgDeqlGTGhhNuY_liQbQ5IwFofxwGluqfKxtOHCPpyLxngaVPOOSjTQgEWTskL5tXnhFfsHqIU4sNfzxtqvxp74m-s',
                    name: 'Silk Camisole',
                    price: '\$145',
                    showFavorite: true,
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida/ADBb0uhJ-F2hsd3VJfrCU_cj6FV1TU3p2odqX3ab7HMjBTgqke9syF7e9FWNHTsq6YH55Gpd0XFIlXe9c-LzyOfN1mnV9xWv-k85mSVvg2UBRPVrhzKrJ6OtpT9QyJyvagc17Q6YgGkLzA-VuFRE8a4DcPg6H9gDDeqev7FIMUCWKWXmpBRVbKbpV3-Wr_6592OjaZ00vzcM_-SmNjun5DOO6jNbxPws9FfhFWNUA6IUlNGPVWei5pA_RKfoQBrm6eX4YhMOhpkD6gWx',
                    name: 'Linen Shirt',
                    price: '\$180',
                    showFavorite: true,
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida/ADBb0uhUZemQDGuLDFbQdBtY64_ij83qWCwpNbl4G2kT56a9srZ-TVW7eYIVP9p8Tw3z58d-uK1NW73sT6CXxdd3eRhxhmLaNQWW7nXEyDKsLDlOq33iJjhP7CmgusLgNJLwD3nxcXIdE1CfAXKBnT3OuHga8BnJtZFAfAUGR1OKKl8UI6Dy58LWi1Ib4PDABhXGels-a5oFPAGaO3HIzPgmmOOxOEOAUyz9m3eGE4Tf6LcQ78_z24I-JD0SlI26O1L97frLaNPeE8Fw',
                    name: 'Cotton Ribbed Tank',
                    price: '\$65',
                    showFavorite: true,
                  ),
                  ProductCard(
                    imageUrl: 'https://lh3.googleusercontent.com/aida/ADBb0ui3pN2do8sz7Kd6Ju2qduFvZk8P7YW2rG1D-wAETV4u6xxqiOHZ_h35VHQi_ZTEFQ86ctjQojSHcA_7ariCW-FM_59qTaiI-YzkRAfeZTjL_be31NQqtwCOvN_OCd0v0REB1CqHQCM6O5yQmRNFln54rwpjI8cT859UxKjSa4EgRZXvYuT3MMLKiHm8-auINUOpD5GX_F05exJgWz_Sc4AsiJq0C5ZXFKL01ZWHntl1FDgqskTsPMExKQfVILS-C3C_JOLdcNM',
                    name: 'Embroidered Blouse',
                    price: '\$210',
                    showFavorite: true,
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
