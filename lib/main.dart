import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'admin/dashboard_screen.dart';
import 'developer/dashboard_screen.dart';
import 'employee/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/admin_dashboard': (context) => const AdminDashboardScreen(),
        '/developer_dashboard': (context) => const DeveloperDashboardScreen(),
        '/employee_dashboard': (context) => const EmployeeDashboardScreen(),
      },
    );
  }
}
