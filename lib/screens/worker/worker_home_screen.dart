import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'assigned_complaints_screen.dart';
import 'clean_photo_screen.dart';
import 'nearby_complaints_screen.dart';
import 'profile_screen.dart';
import 'notifications_screen.dart';

class WorkerHomeScreen extends StatefulWidget {
  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  int _currentIndex = 0;
  static final _screens = [
    _WorkerHomeMain(),
    WorkerNotificationsScreen(),
    WorkerProfileScreen(),
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

class _WorkerHomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Hello, Worker!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 18,
              crossAxisSpacing: 18,
              children: [
                _FeatureCard(
                  icon: Icons.assignment_turned_in,
                  label: "Assigned Complaints",
                  color: Colors.orange,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AssignedComplaintsScreen())),
                ),
                _FeatureCard(
                  icon: Icons.cleaning_services,
                  label: "Clean Photo Upload",
                  color: Colors.green,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CleanPhotoScreen())),
                ),
                _FeatureCard(
                  icon: Icons.location_searching,
                  label: "Nearby Complaints",
                  color: Colors.blue,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NearbyComplaintsScreen())),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _FeatureCard({required this.icon, required this.label, required this.color, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color.withOpacity(0.17),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 44),
              SizedBox(height: 16),
              Text(label, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}