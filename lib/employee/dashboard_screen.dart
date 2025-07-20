import 'package:flutter/material.dart';

class EmployeeDashboardScreen extends StatelessWidget {
  const EmployeeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Dashboard')),
      body: const Center(child: Text('Welcome, Employee!')),
    );
  }
}
