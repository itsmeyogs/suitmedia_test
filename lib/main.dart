import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/app_state.dart';
import 'package:suitmedia_test/view/first_screen/first_screen.dart';
import 'package:suitmedia_test/view_model/third_view_model.dart';

import 'config/routes/routes.dart';


void main() {
  runApp(
      MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=> AppState()),
          ChangeNotifierProvider(create: (_)=> ThirdViewModel())
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      home: const FirstScreen(),
    );
  }
}
