import 'package:addvisor/Features/App/Load_Screen/load_screen.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Pages/home_screen.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Pages/login_screen.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Pages/signUp_screen.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Pages/habit_tracker.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Pages/trackers_directory.dart';
import 'package:addvisor/Features/med_page/screens/med_tracker.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:addvisor/Features/task_page/screens/task_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
        //background
        displaySmall: TextStyle(color: ThemeColors.secondary),
        displayLarge: TextStyle(color: ThemeColors.secondary),
        displayMedium: TextStyle(color: ThemeColors.secondary),
        bodyLarge: TextStyle(color: ThemeColors.secondary),
        bodyMedium: TextStyle(color: ThemeColors.white),
        bodySmall: TextStyle(color: ThemeColors.secondary),
        titleLarge: TextStyle(color: ThemeColors.secondary),
        titleMedium: TextStyle(color: ThemeColors.secondary),
        titleSmall: TextStyle(color: ThemeColors.secondary),
        headlineLarge: TextStyle(color: ThemeColors.secondary),
        headlineMedium: TextStyle(color: ThemeColors.secondary),
        headlineSmall: TextStyle(color: ThemeColors.secondary),
        labelLarge: TextStyle(color: ThemeColors.secondary),
        labelMedium: TextStyle(color: ThemeColors.secondary),
        labelSmall: TextStyle(color: ThemeColors.secondary),
      )),
      /*
      theme: ThemeData(
        colorScheme: ColorScheme(
            background: ThemeColors.grey,
            primary: ThemeColors.ivory,
            brightness: Brightness.dark,
            error: ThemeColors.red,
            onPrimary: ThemeColors.ivory,
            secondary: ThemeColors.lightBlue,
            onSecondary: ThemeColors.darkBlue,
            onError: ThemeColors.red,
            onBackground: ThemeColors.grey,
            surface: ThemeColors.ivory,
            onSurface: ThemeColors.ivory),
        useMaterial3: false,
      ),*/
      routes: {
        //routes to diff pages
        '/': (context) => LoadScreen(child: LoginScreen()),
        '/login': (context) => LoginScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/trackers': (context) => TrackersDirectory(),
        '/habits': (context) => HabitScreen(),
        '/tasks': (context) => taskScreen(),
        '/meds': (context) => medScreen(),
      },
    );
  }
}
