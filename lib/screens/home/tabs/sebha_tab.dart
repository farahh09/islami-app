import 'package:flutter/material.dart';
import 'package:islami/core/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> sebha = [
    'سُبْحَانَ اللَّهِ',
    'الْحَمْدُ لِلَّهِ',
    'لَا إِلٰهَ إِلَّا اللَّهُ',
    'اللَّهُ أَكْبَرُ',
  ];
  int count = 0;
  double angle = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sebha_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 217),
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى", style: AppStyles.sebhaStyle),
          SizedBox(height: 16),
          Image.asset('assets/images/sebha_head.png'),
          InkWell(
            onTap: isSebhaFinished,
            child: Stack(
              alignment: AlignmentGeometry.topCenter,
              children: [
                Transform.rotate(
                  angle: angle,
                  child: Image.asset('assets/images/sebha_body.png'),
                ),
                Column(
                  children: [
                    SizedBox(height: 120,),
                    Text(sebha[index], style: AppStyles.sebhaStyle),
                    SizedBox(height: 25,),
                    Text("$count", style: AppStyles.sebhaStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void isSebhaFinished() {
    if (count == 30) {
      count = 0;
      index++;
    }
    if (index == sebha.length) {
      index = 0;
    }
    count++;
    angle += (2 * 3.14) / 30;
    setState(() {});
  }
}
