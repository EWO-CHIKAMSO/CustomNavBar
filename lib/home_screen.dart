import 'package:enterprise/new_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Function to navigate with flip animation
  void _navigateWithFlipAnimation(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (context, animation, secondaryAnimation) => const NewPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Flip animation
          var flipAnimation = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          );

          return AnimatedBuilder(
            animation: flipAnimation,
            builder: (context, child) {
              // Rotate back to 0 degrees after the animation completes
              final angle = flipAnimation.value < 0.5
                  ? flipAnimation.value * 3.14 // Rotate forward
                  : (1 - flipAnimation.value) * 3.14; // Rotate backward

              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // Perspective
                  ..rotateY(angle), // Rotate along Y-axis
                alignment: Alignment.center,
                child: child,
              );
            },
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        toolbarHeight: 80,
      ),
      body: Stack(
        children: [
          
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height: 80,
              width: size.width,
              child: Stack(
                children: [
                  // Custom curved background
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: NewCustomPainter(),
                  ),
                  // FloatingActionButton at the center
                  Center(
                    heightFactor: 0.6,
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: FloatingActionButton(
                        backgroundColor: Colors.orange,
                        onPressed: () => _navigateWithFlipAnimation(context),
                        child: const Icon(
                          Icons.local_activity,
                          size: 35,
                          color: Colors.white,
                        ),
                        shape: const CircleBorder(),
                        elevation: 0.1,
                      ),
                    ),
                  ),
                  // Bottom navigation icons
                  Container(
                    height: 80,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: const Icon(Icons.home),
                        // ),

                        SvgPicture.asset('assets/images/house-solid.svg',height: 30,width: 30,),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.wallet),
                        ),
                        const SizedBox(width: 70), // Space for the FAB
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_bag_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.manage_accounts_outlined),
                        ),
                      ],
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

class NewCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.lightBlueAccent
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(10), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 15, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// New Page to Navigate To
