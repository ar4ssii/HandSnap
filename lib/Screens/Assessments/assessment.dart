import 'package:flutter/material.dart';
import 'package:handsnap_ver_1/Screens/Assessments/OpenAssessment.dart';
import '../../includes/drawer_widget.dart';
import 'AddAssessment.dart';
import '../../includes/CategoryCard.dart';
import '../../includes/custom_app_bar.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AssessmentPage(),
  ));
}

class AssessmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Assessments'),
      drawer: AppDrawer(),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryCard(
                title: 'Activity #1',
                description: 'BSIT - 1A',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OpenAssessmentPage()),
                  );
                },
              ),
              CategoryCard(
                title: 'Quiz # 2',
                description: 'BSIT - 1B',
                onTap: () {
                  // Navigate to classlist
                },
              ),

              // Add more CategoryCard widgets as needed
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAssessment()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF00796B),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
