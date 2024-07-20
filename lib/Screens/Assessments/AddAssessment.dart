import 'package:flutter/material.dart';
import 'package:handsnap_ver_1/Screens/Assessments/assessment.dart';
import '../../includes/drawer_widget.dart';
import '../../includes/QuestionCard.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AddAssessment(),
  ));
}

class AddAssessment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assessments',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF00796B),
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => AssessmentPage()),
              );
            },
            child: Text(
              'Done',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Assessment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Text(
                'Assessment Type',
                style: TextStyle(fontSize: 18),
              ),
              Column(
                children: [
                  RadioListTile(
                    title: Text('Activity'),
                    value: 'Activity',
                    groupValue: 'type',
                    onChanged: (value) {},
                  ),
                  RadioListTile(
                    title: Text('Assignment'),
                    value: 'Assignment',
                    groupValue: 'type',
                    onChanged: (value) {},
                  ),
                  RadioListTile(
                    title: Text('Quiz'),
                    value: 'Quiz',
                    groupValue: 'type',
                    onChanged: (value) {},
                  ),
                ],
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Students',
                ),
                items: [
                  DropdownMenuItem(
                    child: Text('BSIT - 1A'),
                    value: 'BSIT - 1A',
                  ),
                  DropdownMenuItem(
                    child: Text('BSIT - 1B'),
                    value: 'BSIT - 1B',
                  ),
                  DropdownMenuItem(
                    child: Text('BSIT - 2A'),
                    value: 'BSIT - 2A',
                  ),
                ],
                onChanged: (value) {},
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Deadline Reminder Date',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Questions:',
                style: TextStyle(fontSize: 18),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Add New Question'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Question here...',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10), // Adds padding inside the text field
                                  ),
                                  maxLines: 5, // Sets the number of lines to display
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Points',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel', style: TextStyle(color: Colors.black54),),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Handle confirm button press
                                Navigator.pop(context); // Close the modal
                              },
                              child: Text('Add'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff0C796E),
                                foregroundColor: Colors.white, // Set the text color to white
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Add Questions'),
                  style: ElevatedButton.styleFrom(

                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF00796B),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  QuestionCard(
                    questionNumber: 4,
                    questionText: 'Question here...',
                  ),
                  QuestionCard(
                    questionNumber: 3,
                    questionText: 'Question here...',
                  ),
                  QuestionCard(
                    questionNumber: 2,
                    questionText: 'Question here...',
                  ),
                  QuestionCard(
                    questionNumber: 1,
                    questionText: 'Question here...',
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


