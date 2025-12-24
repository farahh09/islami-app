import 'package:flutter/material.dart';
import 'package:islami/screens/home/home_screen.dart';
import 'package:islami/screens/sura_details/sura_details_screen.dart';

import 'core/cache_helper.dart';
import 'intro_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Janna'),
      debugShowCheckedModeBanner: false,
      initialRoute: CacheHelper.getBool('introduction') == true
          ? HomeScreen.routeName
          : IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),

      },
    );
  }
}
