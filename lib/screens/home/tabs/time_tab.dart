import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/prayer_model.dart';

class TimeTab extends StatelessWidget {
  final List<PrayerModel> prayers = [
    PrayerModel(prayer: "Fajr", time: "04:04"),
    PrayerModel(prayer: "Dhuhr", time: "01:01"),
    PrayerModel(prayer: "ASR", time: "04:38"),
    PrayerModel(prayer: "Maghrib", time: "07:57"),
    PrayerModel(prayer: "Isha", time: "09:20"),
  ];
  TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/time_bg.png"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 201,),
          Container(
            width: 390,
            height: 300,
            decoration: BoxDecoration(
                color: Color(0xFF856B3F),
                borderRadius: BorderRadius.circular(40)
            ),
            child: Stack(
              children: [
                Image.asset('assets/images/time_tab.png'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(top: 14, left: 25),
                      child: Text("16 Jul,\n2024", style: TextStyle(color: Colors.white, fontSize: 16),),
                    )),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Pray Time", style: AppStyles.bodyStyle?.copyWith(color: AppColors.black.withOpacity(0.7)),),
                          ),
                          Text("Tuesday", style: AppStyles.bodyStyle?.copyWith(color: AppColors.black),),
                        ],
                      ),
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(left: 45, top: 14),
                      child: Text("09 Muh,\n     1446", style: TextStyle(color: Colors.white, fontSize: 16),),
                    )),

                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 104),
                      child: CarouselSlider(
                          options: CarouselOptions(height: 140, viewportFraction: 0.26,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.2,
                          ),
                          items: prayers.map((prayer) {
                            return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: 104,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [AppColors.black, Color(0xFFB19768)],
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(prayer.prayer, style: AppStyles.timeStyle),
                                        Text(prayer.time, style: TextStyle(color: Colors.white, fontSize: 32)),
                                        Text("PM", style: AppStyles.timeStyle),
                                      ],
                                    ),
                                  );
                                }
                            );
                          }).toList()

                      ),
                    ),
                    SizedBox(height: 18,),
                    Row(
                      children: [
                        SizedBox(width: 130,),
                        Text("Next Pray", style: AppStyles.bodyStyle?.copyWith(color: AppColors.black.withOpacity(0.7), fontSize: 16),),
                        Text(" - 02:32", style: AppStyles.timeStyle?.copyWith(color: AppColors.black),),
                        SizedBox(width: 73,),
                        Image.asset('assets/images/time_sound_off.png')
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Azkar", style: AppStyles.timeStyle,),
              )),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Image.asset('assets/images/evening_azkar.png'),
              ),
              Image.asset('assets/images/morning_azkar.png')
            ],
          )

        ],
      ),
    );
  }
}
