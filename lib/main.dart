//------------------------REQUIRED-PACKAGES-----------------------
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ----------------------------Views------------------------------
import './view/Home.dart';
import './view/Help.dart';
import './view/juzzIndex.dart';
import './view/intro.dart';
import './view/ShareApp.dart';
import './view/SajdaIndex.dart';
import './view/suraIndex.dart';
//-----------------------FINISH-IMPORT-------------------------------------

//-------VAR-----------------------
int initScreen;
//----------FINISH-VAR----------------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt('initScreen');
  await prefs.setInt('initScreen', 1);
  runApp(MyApp());
}

//-------------------------REQUIRED-HERE-TO-BUILD-DARK-THEME-AFTER-CALL-MAIN--------------------------
final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: const Color(0xff896277),
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black,
  fontFamily: 'Sogeo',
  textTheme: TextTheme(
    headline1: TextStyle(
        fontFamily: 'Sogeo', fontSize: 42, fontWeight: FontWeight.w600),
    headline2: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Sogeo'),
    bodyText1: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 18, fontFamily: 'Sogeo'),
    caption: TextStyle(fontFamily: 'Sogeo', fontSize: 14),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: true,
      home: Builder(
        builder: (context) => Home(
          maxSlide: MediaQuery.of(context).size.width * 0.835,
        ),
      ),
      initialRoute: initScreen == 0 || initScreen == null ? '/intro' : '/intro',
      routes: {
        '/intro': (context) => Intro(),
        '/Home': (context) => Home(
              maxSlide: MediaQuery.of(context).size.width * 0.835,
            ),
        '/SuraIndex': (context) => SuraIndex(),
        '/JuzzIndex': (context) => JuzzIndex(),
        '/Help': (context) => Help(),
        '/ShareApp': (context) => ShareApp(),
        '/SajdaIndex': (context) => SajdaIndex(),
      },
    );
  }
}
