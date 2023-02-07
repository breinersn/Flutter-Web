
import 'package:flutter/material.dart';
import 'package:flutterweb/pages/homePage.dart';
import 'package:flutterweb/values/responsive.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ResponsiveApp responsive;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web',
      builder: (context, child) {
        
       responsive = ResponsiveApp(context);

        return Theme(
            data: ThemeData(
              backgroundColor: Colors.blueGrey[900],
              primaryColor: Colors.black87,
              accentColor: Colors.blueGrey,
              iconTheme: const IconThemeData(color: Colors.white),
              cardColor: Colors.white,
              primaryTextTheme: getTextTheme(),
              textTheme: getTextTheme(),
              indicatorColor: Colors.white,
              unselectedWidgetColor: Colors.blueGrey[300],
              tabBarTheme: TabBarTheme(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.blueGrey[300],
              ),
              accentTextTheme: TextTheme(
                  headline6: TextStyle(
                      color: Colors.blueGrey[300],
                      fontSize: responsive.headline6),
                  bodyText1: TextStyle(
                      color: Colors.blueGrey[100],
                      fontSize: responsive.bodyText1),
                  bodyText2: TextStyle(
                      color: Colors.blueGrey[300],
                      fontSize: responsive.bodyText1)),
            ),
            child: HomePage());
      },
      // home: const HomePage(title: 'Flutter Web'),
    );
  }

  getTextTheme() {
    return TextTheme(
      headline3:
          TextStyle(color: Colors.white, fontSize: responsive.headline3),
      headline6:
          TextStyle(color: Colors.white, fontSize: responsive.headline6),
      bodyText1:
          TextStyle(color: Colors.black, fontSize: responsive.bodyText1),
      bodyText2:
          TextStyle(color: Colors.white, fontSize: responsive.bodyText1),
      headline2:
          TextStyle(color: Colors.white, fontSize: responsive.headline2),
    );
  }
}




