import 'package:flutter/material.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'worker_progress_screen.dart';
import 'reports_screen.dart';
import 'assign_worker_screen.dart';
import 'complaint_list_screen.dart';
import 'profile_screen.dart';
import 'notifications_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _currentIndex = 0;
  static final _screens = [
    _AdminHomeMain(),
    AdminNotificationsScreen(),
    AdminProfileScreen(),
  ];
  void _onTab(int idx) => setState(() => _currentIndex = idx);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: _currentIndex, onTap: _onTab),
      body: _screens[_currentIndex],
    );
  }
}

class _AdminHomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Welcome, Admin!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 18),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
              children: [
                CustomCard(
                  icon: Icons.people,
                  label: "Worker Progress",
                  color: Colors.purple,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WorkerProgressScreen())),
                ),
                CustomCard(
                  icon: Icons.analytics,
                  label: "Reports",
                  color: Colors.blue,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReportsScreen())),
                ),
                CustomCard(
                  icon: Icons.assignment_ind,
                  label: "Assign Worker",
                  color: Colors.green,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AssignWorkerScreen())),
                ),
                CustomCard(
                  icon: Icons.list_alt,
                  label: "Complaint List",
                  color: Colors.orange,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ComplaintListScreen())),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}