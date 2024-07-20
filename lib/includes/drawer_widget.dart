import 'package:flutter/material.dart';
import 'package:handsnap_ver_1/Screens/Profile/profile.dart';
import 'package:handsnap_ver_1/Screens/Classes/classes.dart';
import 'package:handsnap_ver_1/main.dart';
import 'package:handsnap_ver_1/Screens/Assessments/assessment.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF00796B),
            ),
            child: Text(
              'HandSnap++',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Modules'),
            onTap: () {
              // Handle navigation to home
            },
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle_sharp),
            title: Text('Classes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassesPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text('Assessments'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AssessmentPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle navigation to settings
            },
          ),
        ],
      ),
    );
  }
}
