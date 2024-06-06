import 'dart:ui';

import 'package:beyond_the_stars/features/layout/constants/layout_widget_constants.dart';
import 'package:beyond_the_stars/features/layout/ui/widgets/bottom_nav_bar_icon.dart';
import 'package:beyond_the_stars/features/layout/ui/widgets/custom_animated_bar.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 2;
  List<String> pages = ['star', 'crew', 'home', 'chat', 'profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
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
                                            .unselectedBottomNavIcons[index]),
                              ],
                            ),
                          ),
                        ),
                      )),
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Text(pages[currentIndex]),
        ),
      ),
    );
  }
}
