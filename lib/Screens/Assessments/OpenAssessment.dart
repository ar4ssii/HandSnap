import 'package:flutter/material.dart';
import 'package:handsnap_ver_1/Screens/Assessments/assessment.dart';
import '../../includes/drawer_widget.dart';
import '../../includes/QuestionCard.dart';
import '../../includes/custom_app_bar.dart';
import 'ViewScore.dart';
import 'OpenQuestion.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OpenAssessmentPage(),
  ));
}

class OpenAssessmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Assessments'),
      drawer: AppDrawer(),
      body: Scrollbar(
        thumbVisibility: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black54, width: 1.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Activity # 1',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '08/18/2024 | 10:00 am until 08/18/2024 | 12:00 pm',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Assessment Type: Activity',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Class Students: BSIT - 1A',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Question Count: 10',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Total Score: 100',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AssessmentScoresPage()),
                            );
                          },
                          child: Text('View Scores'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xFF00796B),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle edit action
                          },
                          child: Text('Edit'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Column(
                  children: List.generate(
                    10,
                        (index) => QuestionCard(
                      questionNumber: index + 1,
                      questionText: 'Question here...',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OpenQuestionPage(questionNumber: index + 1)),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
