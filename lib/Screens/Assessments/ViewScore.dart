import 'package:flutter/material.dart';
import '../../includes/drawer_widget.dart';
import '../../includes/custom_app_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AssessmentScoresPage(),
  ));
}

class AssessmentScoresPage extends StatelessWidget {
  final List<StudentScore> studentScores = [
    StudentScore(name: 'Kim, Anne', score: 100),
    StudentScore(name: 'White, John', score: 100),
    StudentScore(name: 'Blake, Pia', score: 100),
    StudentScore(name: 'Doe, Ryan', score: 100),
    StudentScore(name: 'Gosling, Mark', score: 100),
    StudentScore(name: 'Reynolds, Matt', score: 100),
    StudentScore(name: 'Hemmings, Luke', score: 100),
    StudentScore(name: 'Silvan, Kath', score: 100),
    StudentScore(name: 'Malik, Zayn', score: 100),
    StudentScore(name: 'Shin, Xyril', score: 100),
    StudentScore(name: 'Kim, Anne', score: 100),
    StudentScore(name: 'White, John', score: 100),
    StudentScore(name: 'Blake, Pia', score: 100),
    StudentScore(name: 'Doe, Ryan', score: 100),
    StudentScore(name: 'Gosling, Mark', score: 100),
    StudentScore(name: 'Reynolds, Matt', score: 100),
    StudentScore(name: 'Hemmings, Luke', score: 100),
    StudentScore(name: 'Silvan, Kath', score: 100),
    StudentScore(name: 'Malik, Zayn', score: 100),
    StudentScore(name: 'Shin, Xyril', score: 100),
  ];

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
                Text(
                  'Activity # 1 / View Scores / BSIT - 1A',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Student Count: ${studentScores.length}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 16.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: DataTable(
                      columnSpacing: 20,
                      columns: [
                        DataColumn(label: Text('#')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Scores')),
                      ],
                      rows: List.generate(studentScores.length, (index) {
                        final student = studentScores[index];
                        return DataRow(cells: [
                          DataCell(Text('${index + 1}')),
                          DataCell(
                            GestureDetector(
                              onTap: () {
                                // Handle the tap, e.g., navigate to a detailed page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StudentDetailPage(student: student),
                                  ),
                                );
                              },
                              child: Text(
                                student.name,
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          DataCell(Text('${student.score}')),
                        ]);
                      }),
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

class StudentScore {
  final String name;
  final int score;

  StudentScore({required this.name, required this.score});
}

class StudentDetailPage extends StatelessWidget {
  final StudentScore student;

  StudentDetailPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Assessments'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Activity # 1 / View Scores / BSIT - 1A / ${student.name}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Total Score: ${student.score}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Q#')),
                      DataColumn(label: Text('Scores')),
                      DataColumn(label: Text('Snapped Answer')),
                    ],
                    rows: List.generate(10, (index) {
                      return DataRow(cells: [
                        DataCell(Text('${index + 1}')),
                        DataCell(Text('10')), // Assuming each question has a score of 10
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              // Handle the view answer action
                            },
                            child: Text('View'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF00796B), // Text color
                            ),
                          ),
                        ),
                      ]);
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
