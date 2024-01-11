import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/views/explore/exploresceen.dart';
import 'package:drive_app/views/hightnits/hightnits.dart';
import 'package:drive_app/views/hometasks/hometasks_screen.dart';
import 'package:drive_app/views/profile/profilescreen.dart';
import 'package:drive_app/views/trips/tripsscreen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({Key? key}) : super(key: key);

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  int currentindex = 0;
  final List<Widget> pages = <Widget>[
    const HomeTasksScreen(),
    const TripsScreen(),
    const ExplporeScreen(),
    const HightintsScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: pages[currentindex],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: AppColor.mainColor,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(color: Colors.red),
      currentIndex: currentindex,
      onTap: (value) {
        setState(() {
          currentindex = value;
          if (currentindex == 2) {}
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: 'Home '),
        BottomNavigationBarItem(
            icon: Icon(IconlyLight.bookmark), label: 'Picked up '),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'completed',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.chart),
          label: 'Hightnits',
        ),
        BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile), label: 'Profile'),
      ],
    );
  }
}
