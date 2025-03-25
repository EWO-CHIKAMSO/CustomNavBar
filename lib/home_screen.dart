
import 'package:enterprise/commons/custom_bottom_nav.dart';
import 'package:enterprise/new_page.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final GlobalKey<FlipCardState> _flipKey = GlobalKey<FlipCardState>();
  bool _isFlipped = false;

  void _flipAndNavigate() {
    setState(() {
      _isFlipped = !_isFlipped;
    });

    _flipKey.currentState?.toggleCard();

    // Delay navigation slightly to match the flip effect
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        _pageController.animateToPage(
          _isFlipped ? 1 : 0, // Navigate between pages
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Prevent swipe
        children: [
          // First page: FlipCard
          Center(
            child: FlipCard(
              key: _flipKey,
              direction: FlipDirection.HORIZONTAL,
              speed: 600,
              front: Container(
                height: 200,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 5, spreadRadius: 2),
                  ],
                ),
                child: const Text(
                  "Tap to Flip",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              back: Container(
                height: 200,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 5, spreadRadius: 2),
                  ],
                ),
                child: const Text(
                  "Navigating...",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),

          // Second Page: New Page Content
          const NewPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(
        onFabPressed: _flipAndNavigate,
        isFlipped: _isFlipped, // This is the crucial line you were missing
      ),
    );
  }
}


