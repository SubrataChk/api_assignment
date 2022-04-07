import 'package:api_assignment/src/api/apiservice.dart';
import 'package:api_assignment/src/auth/login.dart';
import 'package:api_assignment/src/home/home.dart';
import 'package:api_assignment/src/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Api Assignment',
          theme: ThemeData.light(),
          home: LoginPageSection(),
        );
      },
    );
  }
}
