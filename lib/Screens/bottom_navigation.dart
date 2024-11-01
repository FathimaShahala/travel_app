import 'package:flutter/material.dart';
import 'package:travel_app/Screens/chat_screen.dart';
import 'package:travel_app/Screens/favourite_screen.dart';
import 'package:travel_app/Screens/home_screen.dart';
import 'package:travel_app/Screens/profile_Screen.dart';
import 'package:travel_app/Screens/tickets_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  // Define list of screens and images used in the navigation bar
  final List<Widget> _screens = [
    const HomeScreen(),
    const TicketsScreen(),
    ChatBotScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),  
  ];

  final List<String> _listOfImages = [
    "assets/ic_home.png",
    "assets/ic_location.png",
    "assets/ic_chat.png",
    "assets/ic_fav.png",
    "assets/ic_Profile.png",

    // AppImages.home,
    // AppImages.home,
    // AppImages.home,
    // AppImages.home,
    // AppImages.home,

  ];

  // Update the selected index on tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(displayWidth),
    );
  }

  // Bottom navigation bar widget
  Widget _buildBottomNavigationBar(double displayWidth) {
    return Container(
      //margin: EdgeInsets.all(displayWidth * 0.01),
      height: displayWidth * 0.155,
      decoration: BoxDecoration(
        color:  Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 147, 131, 216),
            offset: Offset(0, -1),
            blurRadius: 10,
          ),
        ],
        borderRadius: const BorderRadius.only(topLeft:  Radius.circular(40),topRight: Radius.circular(40)),
      ),
      child: ListView.builder(
        itemCount:5, //_screens.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _buildNavItem(displayWidth, index),
      ),
    );
  }

  // Individual navigation item widget
  Widget _buildNavItem(double displayWidth, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        //width: index == _selectedIndex ? displayWidth * .32 : displayWidth * .18,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: displayWidth * .1,
              //width: index == _selectedIndex ? displayWidth * .08 : 0,
              decoration: BoxDecoration(
                color: index == _selectedIndex ? Colors.grey.shade200 : Colors.transparent,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Image.asset(
                _listOfImages[index],
                height: displayWidth * .07,
                color: index == _selectedIndex ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
