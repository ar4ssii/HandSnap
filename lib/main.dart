import 'package:flutter/material.dart';
import 'Screens/Profile/profile.dart';
import 'Screens/Classes/classes.dart';
import 'Screens/Assessments/assessment.dart';
import 'includes/CategoryCard.dart';
import 'includes/custom_app_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryCard(
              title: 'Modules',
              description: 'Manage My Learning Materials',
              onTap: () {
                // Navigate to Modules
              },
            ),
            CategoryCard(
              title: 'Classes',
              description: 'Manage Class Lists',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassesPage()),
                );
              },
            ),
            CategoryCard(
              title: 'Assessments',
              description: 'Manage Sets of Activity, Assignments or Quiz for Students',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssessmentPage()),
                );
              },
            ),
            CategoryCard(
              title: 'Profile',
              description: 'Manage My Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
