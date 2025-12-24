import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';

class RadioItem extends StatelessWidget {
  final bool isPlay;
  final bool soundOn;
  final String name;

  const RadioItem({
    super.key,
    required this.isPlay,
    required this.soundOn,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 390,
        height: 133,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(
              isPlay
                  ? 'assets/images/wave.png'
                  : 'assets/images/radio_tab_bg.png',
            ),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  '$name',
                  style: AppStyles.bodyStyle?.copyWith(color: Colors.black),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: isPlay == true
                        ? Image.asset('assets/images/ic_pause.png', width: 44)
                        : Image.asset('assets/images/ic_play.png', width: 44),
                  ),
                ),
                SizedBox(width: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: soundOn == true
                        ? Image.asset('assets/images/ic_sound_on.png', width: 30,)
                        : Image.asset('assets/images/ic_sound_off.png', width: 30,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
