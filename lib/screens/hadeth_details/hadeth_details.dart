import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_styles.dart';
import '../../models/hadeth_model.dart';


class HadethDetails extends StatelessWidget {
  static const String routeName = "HadithDetails";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        iconTheme: IconThemeData(color: AppColors.primary),
        centerTitle: true,
      ),

      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset('assets/images/soura_details_screen.png', fit: BoxFit.cover,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Text(model.title, style: AppStyles.titleStyle),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView.builder(
                      itemCount: model.content.length,
                      itemBuilder: (context, index) => Center(
                        child: Text(
                          model.content[index],
                          textAlign: TextAlign.center,
                          style: AppStyles.bodyStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}