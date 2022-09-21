import 'package:flutter/material.dart';
import 'package:gl_play/screens/home_screen.dart';
import 'package:gl_play/screens/more_screen.dart';
import 'package:gl_play/screens/notifications_screen.dart';
import 'package:gl_play/screens/promotion_screen.dart';


import 'activities_screen.dart';
import 'attractions_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List<Widget> screenList = [
    const HomeScreen(),
    const ActivitiesScreen(),
    const AttractionsScreen(),
    const PromotionScreen(),
    const NotificationsScreen(),
    const MoreScreen(),
  ];
  late PageController _pageController;
  late int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: screenList,
          // onPageChanged: (index){
          //   setState(() {
          //     _selectedIndex = index;
          //   });
          // },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedFontSize: 10.0,
          unselectedFontSize: 10.0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
              //_pageController.jumpToPage(index);
            })
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_activity), label: "Activities"),
            BottomNavigationBarItem(
                icon: Icon(Icons.landscape), label: "Attractions"),
            BottomNavigationBarItem(
                icon: Icon(Icons.percent), label: "Promotion"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: "More"),
          ],
        ),
      ),
    );
  }



}
