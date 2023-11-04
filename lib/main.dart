import 'package:addvisor/Features/App/Load_Screen/load_screen.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Pages/home_screen.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Pages/login_screen.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Pages/signUp_screen.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Pages/habit_tracker.dart';
import 'package:addvisor/Features/User_Auth/Presentation/Pages/trackers_directory.dart';
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
        displaySmall: TextStyle(color: ThemeColors.grey),
        displayLarge: TextStyle(color: ThemeColors.grey),
        displayMedium: TextStyle(color: ThemeColors.grey),
        bodyLarge: TextStyle(color: ThemeColors.grey),
        bodyMedium: TextStyle(color: ThemeColors.grey),
        bodySmall: TextStyle(color: ThemeColors.grey),
        titleLarge: TextStyle(color: ThemeColors.grey),
        titleMedium: TextStyle(color: ThemeColors.grey),
        titleSmall: TextStyle(color: ThemeColors.grey),
        headlineLarge: TextStyle(color: ThemeColors.grey),
        headlineMedium: TextStyle(color: ThemeColors.grey),
        headlineSmall: TextStyle(color: ThemeColors.grey),
        labelLarge: TextStyle(color: ThemeColors.grey),
        labelMedium: TextStyle(color: ThemeColors.grey),
        labelSmall: TextStyle(color: ThemeColors.grey),
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
        '/': (context) => LoadScreen(child: LoginScreen()),
        '/login': (context) => LoginScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/trackers': (context) => TrackersDirectory(),
        '/habits': (context) => HabitScreen(),
        '/tasks': (context) => taskScreen(),
      },
    );
  }
}
