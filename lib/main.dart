import 'package:flutter/material.dart';
// import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/utils/splash_view.dart';
import 'package:estructura_practica_1/utils/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primaryColor: colorDarkBlue,
        accentColor: colorLightOrange,
        textTheme: _myTextTheme,
      ),
      home: SplashView(),
      //Home(title: APP_TITLE),
    );
  }
}

final TextTheme _myTextTheme = _buildTextTheme();

TextTheme _buildTextTheme() {
  TextTheme base = ThemeData.light().textTheme;
  return base
      .copyWith(
        headline4: base.headline4.copyWith(
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          fontFamily: "OpenSansR",
        ),
        headline5: base.headline5.copyWith(
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
          color: colorWhite,
          fontFamily: "OpenSansL",
        ),
        headline6: base.headline6.copyWith(
          fontSize: 23.0,
          fontWeight: FontWeight.w500,
          color: colorDarkerBlue,
          fontFamily: "OpenSansL",
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          fontFamily: "OpenSansR",
        ),
        bodyText1: base.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          fontFamily: "OpenSansR",
        ),
        bodyText2: base.bodyText2.copyWith(
          fontFamily: "OpenSansR",
        ),
        subtitle1: base.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: colorWhite,
          fontFamily: "OpenSansR",
        ),
      )
      .apply();
}
