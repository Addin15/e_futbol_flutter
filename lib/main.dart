import 'dart:developer';

import 'package:e_futbol_flutter/auth.dart';
import 'package:e_futbol_flutter/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'models/user.dart';
import 'pages/web/consumer/home.dart';
import 'pages/web/landing.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, device) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthService>(
              create: (context) => AuthService(),
            ),
          ],
          child: const MaterialApp(
            title: 'E-Futbol',
            debugShowCheckedModeBanner: false,
            home: AuthWrapper(),
          ),
        );
      },
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, data, child) {
        User? user = data.user;

        if (user == null) {
          return const Landing();
        } else {
          return const Home();
        }
      },
    );
  }
}
