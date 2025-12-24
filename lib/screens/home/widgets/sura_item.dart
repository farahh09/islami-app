import 'package:flutter/material.dart';
import 'package:islami/models/sura_model.dart';

class SuraItem extends StatelessWidget {
  final SuraModel model;

  const SuraItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          model.nameEn,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          model.nameAr,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "${model.versesCount} Verses",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/sura_number.png", width: 52, height: 52),
            Text(
              "${model.suraIndex}",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

    );
  }
}
