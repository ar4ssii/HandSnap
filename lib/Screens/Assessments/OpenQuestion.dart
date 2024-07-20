import 'package:flutter/material.dart';
import 'package:handsnap_ver_1/Screens/Assessments/SnapCode.dart';
import '../../includes/custom_app_bar.dart';

class OpenQuestionPage extends StatelessWidget {
  final int questionNumber;

  OpenQuestionPage({required this.questionNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Assessments'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity # 1 / Question # $questionNumber',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Question display here',
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SnapCodePage(
                  questionNumber: questionNumber,
                  studentNames: _getStudentNames(),
                ),
              ),
            );
          },
          child: Text('Snap Code'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF00796B),
            padding: EdgeInsets.symmetric(vertical: 15),
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  List<StudentNames> _getStudentNames() {
    return [
      StudentNames(name: 'Kim, Anne'),
      StudentNames(name: 'White, John'),
      // Add more students as needed
    ];
  }
}
