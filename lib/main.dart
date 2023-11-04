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
        displaySmall: TextStyle(color: ThemeColors.ivory),
        displayLarge: TextStyle(color: ThemeColors.ivory),
        displayMedium: TextStyle(color: ThemeColors.ivory),
        bodyLarge: TextStyle(color: ThemeColors.ivory),
        bodyMedium: TextStyle(color: ThemeColors.ivory),
        bodySmall: TextStyle(color: ThemeColors.ivory),
        titleLarge: TextStyle(color: ThemeColors.ivory),
        titleMedium: TextStyle(color: ThemeColors.ivory),
        titleSmall: TextStyle(color: ThemeColors.ivory),
        headlineLarge: TextStyle(color: ThemeColors.ivory),
        headlineMedium: TextStyle(color: ThemeColors.ivory),
        headlineSmall: TextStyle(color: ThemeColors.ivory),
        labelLarge: TextStyle(color: ThemeColors.ivory),
        labelMedium: TextStyle(color: ThemeColors.ivory),
        labelSmall: TextStyle(color: ThemeColors.ivory),
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
