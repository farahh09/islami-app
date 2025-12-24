import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import '../../tabs/hadeth_tab.dart';
import '../../tabs/quran_tab.dart';
import '../../tabs/radio_tab.dart';
import '../../tabs/sebha_tab.dart';
import '../../tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        backgroundColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: selectedTab,
        onTap: (value) {
          selectedTab = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            icon: _getBottomNavBarItem("ic_quran", 0),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            icon: _getBottomNavBarItem("ic_hadeth", 1),
            label: "Hadeth",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            icon: _getBottomNavBarItem("ic_sebha", 2),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            icon: _getBottomNavBarItem("ic_radio", 3),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primary,
            icon: _getBottomNavBarItem("ic_time", 4),
            label: "Time",
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          tabs[selectedTab],
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Image.asset("assets/images/islami_top.png"),
          ),
        ],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  Widget _getBottomNavBarItem(String image, int index) {
    return selectedTab == index
        ? Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ImageIcon(AssetImage("assets/images/$image.png")),
    )
        : ImageIcon(AssetImage("assets/images/$image.png"));
  }
}