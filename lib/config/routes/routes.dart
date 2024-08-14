import 'package:flutter/material.dart';
import 'package:suitmedia_test/view/first_screen/first_screen.dart';
import 'package:suitmedia_test/view/second_screen/second_screen.dart';
import 'package:suitmedia_test/view/third_screen/third_screen.dart';

class Routes{
  static Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){

    //route dari Register Page
      case FirstScreen.routeName:
        return _materialRoute(
            const FirstScreen()
        );

      case SecondScreen.routeName:
        return _materialRoute(
            const SecondScreen()
        );

      case ThirdScreen.routeName:
        return _materialRoute(
            const ThirdScreen()
        );

      default:
        return _materialRoute(
            const FirstScreen()
        );
    }
  }

  static Route _materialRoute(Widget view) => MaterialPageRoute(
    builder: (_) => view,
  );

  Routes._();
}