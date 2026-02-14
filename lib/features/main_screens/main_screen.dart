import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/features/main_screens/profile_screen/presentation/profile_screen.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;
  // List of widgets to display in each tab
  static const List<Widget> _widgetOptions = <Widget>[
    Text('HOME PAGE'),
    Text('EXPLORE PAGE'),
    Text('FAVOURITE PAGE'),
    Text('MY BOOKING PAGE'),
    ProfileScreen(),
  ];

  // Method to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: BottomNavigationBar(
          unselectedItemColor: AppColors.grayNeutral[400],
          selectedItemColor: AppColors.grayBlue[600],
          showUnselectedLabels: true,
          //backgroundColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 3,
                    width: 50,
                    padding: EdgeInsets.only(top: 10),
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      color: AppColors.grayBlue[600],
                      borderRadius: BorderRadius.circular(2),
                    ),

                    child: Icon(Icons.home),
                  ),
                ],
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 3,
                    width: 50,
                    padding: EdgeInsets.only(top: 10),
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      color: AppColors.grayBlue[600],
                      borderRadius: BorderRadius.circular(2),
                    ),

                    child: Icon(Icons.explore),
                  ),
                ],
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 3,
                    width: 50,
                    padding: EdgeInsets.only(top: 10),
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      color: AppColors.grayBlue[600],
                      borderRadius: BorderRadius.circular(2),
                    ),

                    child: Icon(Icons.favorite),
                  ),
                ],
              ),
              label: 'Favourites',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              activeIcon: Icon(Icons.bookmark),
              label: 'My Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 3,
                    width: 50,
                    padding: EdgeInsets.only(top: 10),
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      color: AppColors.grayBlue[600],
                      borderRadius: BorderRadius.circular(2),
                    ),

                    child: Icon(Icons.person),
                  ),
                ],
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          //selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
