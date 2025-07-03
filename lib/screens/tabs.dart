import 'package:festive_care_cure/screens/infromation_page.dart';
import 'package:festive_care_cure/widgets/drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:festive_care_cure/screens/userProfile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:festive_care_cure/screens/items_info.dart';
import 'package:festive_care_cure/screens/cart_page.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = ItemsInfoScreen();
    String activePageTitle = 'Shop';
    if (_selectedPageIndex == 1) {
      activePage = CartPage();
      activePageTitle = 'Cart';
    } else if (_selectedPageIndex == 2) {
      activePage = InformationScreen();
      activePageTitle = 'Info';
    } else if (_selectedPageIndex == 3) {
      activePage = const UserProfileForm();
      activePageTitle = 'Profile';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: AppDrawer(
        userName: '',
        onSelectScreen: (String identifier) {},
      ),
      body: activePage,
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 27, 26, 26),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            rippleColor: Colors.grey[800]!,
            hoverColor: Colors.grey[700]!,
            haptic: true,
            tabBorderRadius: 15,
            tabShadow: [],
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 900),
            gap: 8,
            color: Colors.grey[800],
            activeColor: const Color.fromARGB(255, 253, 253, 253),
            iconSize: 24,
            tabBackgroundColor: Colors.purple.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Shop',
              ),
              GButton(
                icon: LineIcons.shoppingCart,
                text: 'Cart',
              ),
              GButton(
                icon: LineIcons.info,
                text: 'Info',
              ),
              GButton(
                icon: LineIcons.personEnteringBooth,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedPageIndex,
            onTabChange: _selectPage,
          ),
        ),
      ),
    );
  }
}
