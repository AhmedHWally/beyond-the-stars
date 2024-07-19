import 'dart:ui';

import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/features/company_sections/ui/company_sections_screen.dart';
import 'package:beyond_the_stars/features/home/ui/screens/home_screen.dart';
import 'package:beyond_the_stars/features/layout/constants/layout_widget_constants.dart';
import 'package:beyond_the_stars/features/layout/ui/widgets/bottom_nav_bar_icon.dart';
import 'package:beyond_the_stars/features/layout/ui/widgets/custom_animated_bar.dart';
import 'package:beyond_the_stars/features/profile/ui/profile_screen.dart';
import 'package:beyond_the_stars/features/saved_items/ui/saved_items_screen.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 2;
  List<Widget> screens = [
    const SavedItemsScreen(),
    const CompanySectionsScreen(),
    const HomeScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.authBackGround), fit: BoxFit.fill)),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: currentIndex == 0
              ? const SavedItemsScreen()
              : IndexedStack(
                  index: currentIndex,
                  children: screens,
                ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      LayoutWidgetConstants.selectedbottomNavIcons.length,
                      (index) => Flexible(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                radius: 8,
                                splashColor: Colors.white38,
                                onTap: () {
                                  if (currentIndex != index) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomAnimatedBar(
                                        isActive: currentIndex == index),
                                    BottomNavBarIcon(
                                        icon: currentIndex == index
                                            ? LayoutWidgetConstants
                                                .selectedbottomNavIcons[index]
                                            : LayoutWidgetConstants
                                                    .unselectedBottomNavIcons[
                                                index]),
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
