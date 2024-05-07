import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onay_ai_mvp/features/bookkeeping/bookkeeping_screen.dart';
import 'package:onay_ai_mvp/features/cfo/cfo_screen.dart';
import 'package:onay_ai_mvp/features/chat/chat_screen.dart';
import 'package:onay_ai_mvp/features/profile/profile_screen.dart';
import 'package:onay_ai_mvp/features/taxes/taxes_screen.dart';

import '../../theme/theme_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedTab = 0;
  List<Widget> body = [
    TaxesScreen(),
    CFOScreen(),
    ChatScreen(),
    BookkeepingScreen(),
    ProfileScreen()
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: body[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff2D2E3A),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Color(0xff828EFF),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/receipt_outlined.svg'),
              label: "Taxes",
            activeIcon: SvgPicture.asset('assets/receipt_outlined.svg', color: Color(0xff828EFF),)
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/align_to_bottom_outlined.svg'),
              label: "CFO",
              activeIcon: SvgPicture.asset('assets/align_to_bottom_outlined.svg', color:Color(0xff828EFF) ,)
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/sms_chat_outlined.svg'),
              label: "Chat",
              activeIcon: SvgPicture.asset('assets/sms_chat_outlined.svg', color: Color(0xff828EFF),)),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/insurance.svg'),
              label: "Bookkeeping",
            activeIcon: SvgPicture.asset('assets/insurance.svg', color: Color(0xff828EFF),)
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/user_big_outlined.svg'),
              label: "Profile",
            activeIcon: SvgPicture.asset('assets/user_big_outlined.svg', color: Color(0xff828EFF) ,),
          ),
        ],
      ),
    );
  }
}
