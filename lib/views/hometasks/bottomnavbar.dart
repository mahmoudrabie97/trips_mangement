import 'package:drive_app/cubit/homecubit/homecubit.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:drive_app/utilites/custommethods.dart';
import 'package:drive_app/views/attendance/attendance.dart';
import 'package:drive_app/views/explore/exploresceen.dart';
import 'package:drive_app/views/hightnits/hightnits.dart';
import 'package:drive_app/views/hometasks/hometasks_screen.dart';
import 'package:drive_app/views/profile/profilescreen.dart';
import 'package:drive_app/views/trips/tripsscreen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({Key? key}) : super(key: key);

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  int currentindex = 0;
  final List<Widget> pages = <Widget>[
    AttendancePage(),
    const HomeTasksScreen(),
    // const TripsScreen(),
    Scaffold(),
    //const ExplporeScreen(),
    Scaffold(),
    //const ProfileScreen(),
    Scaffold()
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? shouldExit = await showExitConfirmationDialog(context: context);
        return shouldExit ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: LiquidPullRefresh(
            color: Colors.amber,
            backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
            height: 150,
            onRefresh: () async {
              print('KKKKKKKKKKKKK');
              return await Future.delayed(Duration(seconds: 1))
                  .then((value) {});
            },
            child: pages[currentindex]),
        bottomNavigationBar: buildBottomNavBar(),
      ),
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: AppColor.mainColor,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(color: Colors.red),
      currentIndex: currentindex,
      onTap: (value) {
        if (value < 2) {
          setState(() {
            currentindex = value;
          });
        }
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint), label: 'Shifts '),
        BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: 'Home '),
        BottomNavigationBarItem(
            icon: Icon(IconlyLight.bookmark), label: 'Picked up '),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'completed',
        ),
        BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile), label: 'Profile'),
      ],
    );
  }
}
