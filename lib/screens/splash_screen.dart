import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward().then((_) {
        // After 2 seconds, simulate navigation
        Navigator.pushReplacementNamed(context, '/login');
      });

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF9F9F9), // surface
              Color(0x4DFADADD), // primary-container/30
              Color(0x33FFD9DD), // secondary-fixed/20
            ],
          ),
        ),
        child: Stack(
          children: [
            // Decorative Layers
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0x4DFBDBDE), // primary-fixed/30
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x4DFBDBDE).withOpacity(0.3),
                      blurRadius: 80,
                      spreadRadius: 80,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0x33FFD9DD), // secondary-fixed/20
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x33FFD9DD).withOpacity(0.2),
                      blurRadius: 100,
                      spreadRadius: 100,
                    ),
                  ],
                ),
              ),
            ),

            // Center Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0x1A70585B), // primary/10
                            width: 1,
                          ),
                        ),
                      ),
                      Container(
                        width: 128,
                        height: 128,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1F70585B), // rgba(112,88,91,0.12)
                              offset: Offset(0, 24),
                              blurRadius: 48,
                            ),
                          ],
                        ),
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF70585B),
                                Color(0xFF8C4B55),
                                Color(0xFFFADADD),
                              ],
                              stops: [0.0, 0.5, 1.0],
                            ).createShader(bounds);
                          },
                          child: Text(
                            'S',
                            style: GoogleFonts.notoSerif(
                              fontSize: 72,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Brand Identity
                  Text(
                    'StyleMart',
                    style: GoogleFonts.notoSerif(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      color: const Color(0xFF70585B), // primary
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Style is who you are',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.0, // tracking-widest
                      color: const Color(0xCC765E61), // on-primary-container opacity 80
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Progress Indicator
                  SizedBox(
                    width: 192, // w-48
                    child: AnimatedBuilder(
                      animation: _progressAnimation,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          value: _progressAnimation.value,
                          minHeight: 1,
                          backgroundColor: const Color(0x4DD2C3C4), // outline-variant/30
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0x6670585B), // primary/40
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'COLLECTIONS 2024',
                    style: GoogleFonts.manrope(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3.0, // tracking-[0.3em]
                      color: const Color(0xFF807475), // outline
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Visual Anchor
            Positioned(
              bottom: 48,
              left: 32,
              right: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Atelier',
                    style: GoogleFonts.notoSerif(
                      fontSize: 36,
                      fontStyle: FontStyle.italic,
                      color: const Color(0x1A70585B), // primary/10
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/registration');
                    },
                    borderRadius: BorderRadius.circular(32),
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0x3370585B), // primary/20
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF70585B),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Footer Copyright
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Text(
                '© 2024 STYLEMART GLOBAL ATELIER. ALL RIGHTS RESERVED.',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 10,
                  letterSpacing: 2.0,
                  color: const Color(0x80807475), // outline/50
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
