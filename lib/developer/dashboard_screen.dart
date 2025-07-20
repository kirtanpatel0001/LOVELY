import 'package:flutter/material.dart';

import '../services/mongo_service.dart';

class DeveloperDashboardScreen extends StatefulWidget {
  const DeveloperDashboardScreen({super.key});

  @override
  State<DeveloperDashboardScreen> createState() => _DeveloperDashboardScreenState();
}

class _DeveloperDashboardScreenState extends State<DeveloperDashboardScreen> {
  Map<String, dynamic>? userData;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    setState(() { _loading = true; _error = null; });
    try {
      // Replace with actual API call to fetch user data
      final response = await MongoService.getUserData();
      setState(() { userData = response; });
    } catch (e) {
      setState(() { _error = 'Failed to load user data: $e'; });
    } finally {
      setState(() { _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Developer Dashboard')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Welcome, ${userData?['name'] ?? 'Developer'}!', style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 8),
                      Text('Role: ${userData?['role'] ?? 'developer'}'),
                    ],
                  ),
                ),
    );
  }
}
