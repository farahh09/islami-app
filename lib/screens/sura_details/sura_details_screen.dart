import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/core/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen';
   const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
   @override
   Widget build(BuildContext context) {
     SuraModel model = ModalRoute.of(context)?.settings.arguments as SuraModel;
     if (verses.isEmpty) {
       loadSuraFile(model.suraIndex);
     }
     return Scaffold(
       backgroundColor: AppColors.black,
       appBar: AppBar(
         backgroundColor: AppColors.black,
         iconTheme: IconThemeData(color: AppColors.primary),
         title: Text(model.nameEn, style: AppStyles.bodyStyle),
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
                   padding: const EdgeInsets.only(top: 8.0),
                   child: Text(model.nameAr, style: AppStyles.titleStyle,),
                 ),
                 SizedBox(height: 40),
                 Expanded(
                     child: ListView.builder(
                       itemCount: verses.length,
                         itemBuilder: (context, index) => Center(
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 30),
                             child: Text(
                               verses[index],
                               textAlign: TextAlign.center,
                               style: AppStyles.bodyStyle,
                             ),
                           ),
                         ),
                     )
                 ),
                 SizedBox(height: 100),
               ],
             )
           ],
         ),
       ),

     );
   }
   Future<void> loadSuraFile(int index) async{
     String suraFile = await rootBundle.loadString("assets/files/$index.txt");
     List<String> suraLines = suraFile.split('\n');
     verses = suraLines;
     setState(() {});
   }
}
