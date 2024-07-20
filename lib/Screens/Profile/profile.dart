import 'package:flutter/material.dart';
import '../../includes/drawer_widget.dart';
import '../../includes/custom_app_bar.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: ClipOval(
                child: Image.asset(
                  "lib/assets/profile.jpg",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "Juan Karlos",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF00796B)),
                  ),
                  Text(
                    "Teacher",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for editing profile here
                        // For example, you can navigate to an edit profile screen
                      },
                      child: Text('Edit Profile'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0C796E),
                        foregroundColor: Colors.white, // Set the text color to white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
