import 'package:enterprise/commons/custom_paint.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class CustomBottomNavigation extends StatelessWidget {
  final VoidCallback onFabPressed;
  final bool isFlipped;

  const CustomBottomNavigation({
    super.key,
    required this.onFabPressed,
    this.isFlipped = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      child: Stack(
        children: [
          // Custom paint with conditional color
          CustomPaint(
            size: Size(size.width, 80),
            painter: NewCustomPainter(
              color: isFlipped
                  ? const Color.fromARGB(
                      255, 2, 144, 187) // Orange when flipped
                  : const Color.fromARGB(255, 2, 144, 187), // Original blue
            ),
          ),

          // FloatingActionButton remains unchanged
          Center(
            heightFactor: 0.6,
            child: SizedBox(
              width: 70,
              height: 70,
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 214, 158, 2),
                onPressed: onFabPressed,
                child: Icon(
                  isFlipped
                      ? Icons.power_settings_new
                      : Icons.power_settings_new,
                  size: 35,
                  color: Colors.white,
                ),
                shape: const CircleBorder(),
                elevation: 0.1,
              ),
            ),
          ),

          // Navigation icons that change based on flipped state
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // First icon - changes between home and back
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    isFlipped ? Icons.home : Icons.home,
                    size: 30,
                    color: Colors.white,
                  ),
                ),

                // Second icon - changes between wallet and search
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    isFlipped ? Icons.search : Icons.wallet,
                    size: 30,
                    color: Colors.white,
                  ),
                ),

                // Empty space for the FAB
                const SizedBox(width: 70),

                // Third icon - changes between shopping bag and favorites
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    isFlipped ? Icons.inbox : Icons.shopping_bag_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),

                // Fourth icon - changes between account and settings
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    isFlipped ? Icons.settings : Icons.manage_accounts_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:enterprise/commons/custom_paint.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CustomBottomNavigation extends StatelessWidget {
//   final VoidCallback onFabPressed;
//   const CustomBottomNavigation({super.key, required this.onFabPressed});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       height: 80,
//       width: size.width,
//       child: Stack(
//         children: [
//           CustomPaint(size: Size(size.width, 80), painter: NewCustomPainter()),
//           Center(
//             heightFactor: 0.6,
//             child: SizedBox(
//               width: 70,
//               height: 70,
//               child: FloatingActionButton(
//                 backgroundColor: const Color.fromARGB(255, 250, 150, 1),
//                 onPressed: onFabPressed,
//                 child: const Icon(Icons.local_activity,
//                     size: 35, color: Colors.white),
//                 shape: const CircleBorder(),
//                 elevation: 0.1,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 SvgPicture.asset('assets/images/house-solid.svg',
//                     height: 30, width: 30),
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.wallet,
//                       size: 30,
//                       color: Colors.white,
//                     )),
//                 const SizedBox(width: 70), // Space for the FAB
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.shopping_bag_outlined,
//                       size: 30,
//                       color: Colors.white,
//                     )),
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.manage_accounts_outlined,
//                       size: 30,
//                       color: Colors.white,
//                     )),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
