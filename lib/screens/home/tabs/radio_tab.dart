import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:islami/core/app_colors.dart';
import '../widgets/radio_item.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedTab = 0;
  final List<DataTab> tabs = [
    DataTab(title: 'Radio'),
    DataTab(title: 'Reciters'),
  ];
  final List<String> names = [
    'Ibrahim Al-Akdar',
    'Al-Qaria Yassen',
    'Ahmed Al-trabulsi',
    'Addokali Mohammad Alalim',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/radio_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 208),
          FlutterToggleTab(
            width: 90,
            borderRadius: 12,
            height: 40,
            selectedIndex: selectedTab,
            selectedBackgroundColors: [AppColors.primary],
            unSelectedBackgroundColors: [AppColors.black],
            selectedTextStyle: TextStyle(color: Colors.black, fontSize: 16),
            unSelectedTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            dataTabs: tabs,
            selectedLabelIndex: (index) {
              setState(() {
                selectedTab =index;
              });
            },
            isScroll: false,
          ),
          selectedTab == 0 ? Column(
            children: [
              SizedBox(height: 16,),
              RadioItem(isPlay: false, soundOn: true, name: 'Radio ${names[0]}'),
              SizedBox(height: 16,),
              RadioItem(isPlay: true, soundOn: false, name: 'Radio ${names[1]}'),
              SizedBox(height: 16,),
              RadioItem(isPlay: false, soundOn: true, name: 'Radio ${names[2]}',),
              SizedBox(height: 16,),
              RadioItem(isPlay: false, soundOn: true, name: 'Radio ${names[3]}'),
            ],
          ) : Column(
            children: [
              SizedBox(height: 16,),
              RadioItem(isPlay: false, soundOn: true, name: names[1]),
              SizedBox(height: 16,),
              RadioItem(isPlay: true, soundOn: false, name: names[2]),
              SizedBox(height: 16,),
              RadioItem(isPlay: false, soundOn: true, name: names[0],),
              SizedBox(height: 16,),
              RadioItem(isPlay: false, soundOn: true, name: names[3]),
            ],
          ),
        ],
      ),
    );
  }
}
