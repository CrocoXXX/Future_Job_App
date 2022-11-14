import 'package:flutter/material.dart';
import 'package:future_job_app/models/user_model.dart';
import 'package:future_job_app/pages/homepage.dart';
import 'package:future_job_app/pages/signup_page.dart';
import 'package:future_job_app/pages/splash_page.dart';
import 'package:future_job_app/providers/auth_provider.dart';
import 'package:future_job_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Routing Navigation',
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/signUp': (context) => const SignUpPage(),
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}
