import 'package:e_futbol_flutter/auth.dart';
import 'package:e_futbol_flutter/pages/web/consumer/compare.dart';
import 'package:e_futbol_flutter/pages/web/consumer/nearby.dart';
import 'package:e_futbol_flutter/pages/web/consumer/search.dart';
import 'package:e_futbol_flutter/pages/web/provider/home_provider.dart';
import 'package:flutter/material.dart';
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
          child: MaterialApp(
            title: 'E-Futbol',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => const AuthWrapper(),
              '/home': (context) => const Home(),
              '/nearby': (context) => const NearbyArena(),
              '/search': (context) => const SearchArena(),
              '/compare': (context) => const CompareArena(),
            },
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
        } else if (user.role == 'consumer') {
          return const Home();
        } else {
          return const HomeProvider();
        }
      },
    );
  }
}
