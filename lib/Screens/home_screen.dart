import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app/Data/travel_destination.dart';
import 'package:travel_app/Screens/profile_Screen.dart';
import 'package:travel_app/Widgets/blur_widget.dart';
import 'package:travel_app/Widgets/bottom_bar.dart';
import 'package:travel_app/Widgets/destination_card.dart';
import 'package:travel_app/utils/dropdown.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _selectedIndex = 0;

  late AnimationController _controller;
  late Animation<Offset> _animation;
  String? selectedCity;

  final List<Map<String, dynamic>> cities = [
    {"name": "Lakes", "icon": Icons.water},
    {"name": "Sea", "icon": Icons.beach_access},
    {"name": "Mountain", "icon": Icons.terrain},
    {"name": "Forest", "icon": Icons.forest},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInBack,
    ))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 233, 240, 241),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.location5,
                              size: 16.sp,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Dropdown()
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Iconsax.notification,
                          size: 35,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (_) => ProfileScreen(),
                            ));
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25.r,
                                backgroundImage:
                                    const AssetImage("assets/avatar.jpg"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                search(),
                SizedBox(
                  height: 12.h,
                ),
                category(),
                SizedBox(
                  height: 5.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    final destination = destinations[index];

                    return DestinationCard(destination: destination);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container search() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.black26),
                prefixIcon: Icon(
                  Iconsax.search_normal_1,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox category() {
    return SizedBox(
      height: 35.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: cities
            .map((cityData) => GestureDetector(
                  onTap: () {
                    // Update selected item and rebuild UI
                    setState(() {
                      selectedCity = cityData["name"];
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    padding: EdgeInsets.only(left: 1.w, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: selectedCity == cityData["name"]
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: selectedCity == cityData["name"]
                              ? const Color.fromARGB(255, 188, 219, 246)
                              : Colors.white60,
                          child: Icon(
                            cityData["icon"], // Icon specific to each city
                            size: 18.r,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 12.w), // Space between avatar and text
                        Text(
                          cityData["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: selectedCity == cityData["name"]
                                  ? Colors.blue
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
