import 'package:chatterstick_streaming_app/presentation/bottom_nav/viewmodel/bottom_nav_bar_viewmodel.dart';
import 'package:chatterstick_streaming_app/presentation/favourite/view/favourite_screen.dart';
import 'package:chatterstick_streaming_app/presentation/library/view/library_screen.dart';
import 'package:chatterstick_streaming_app/presentation/setting/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constansts/app_icons.dart';
import '../../home/view/home_screen.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  final List<Widget> _screens = const [
    HomeScreen(),
    LibraryScreen(),
    FavouriteScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[ref.watch(bottomNavBarProvider)],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(bottomNavBarProvider),
        onTap: ref.read(bottomNavBarProvider.notifier).onItemTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.homeNav), label: 'Home'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.libraryNav), label: 'Library'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.favouriteNav), label: 'Favourte'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.menuNav), label: 'Setting'),
        ],
      ),
    );
  }
}
