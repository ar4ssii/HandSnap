import 'package:flutter/material.dart';
import '../../includes/drawer_widget.dart';
import '../../includes/custom_app_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClassListPage(),
  ));
}

class ClassListPage extends StatelessWidget {
  final List<StudentScore> studentScores = [
    StudentScore(name: 'Kim, Anne', col3: 100),
    StudentScore(name: 'White, John', col3: 100),
    StudentScore(name: 'Blake, Pia', col3: 100),
    StudentScore(name: 'Doe, Ryan', col3: 100),
    StudentScore(name: 'Gosling, Mark', col3: 100),
    StudentScore(name: 'Reynolds, Matt', col3: 100),
    StudentScore(name: 'Hemmings, Luke', col3: 100),
    StudentScore(name: 'Silvan, Kath', col3: 100),
    StudentScore(name: 'Malik, Zayn', col3: 100),
    StudentScore(name: 'Shin, Xyril', col3: 100),
    StudentScore(name: 'Kim, Anne', col3: 100),
    StudentScore(name: 'White, John', col3: 100),
    StudentScore(name: 'Blake, Pia', col3: 100),
    StudentScore(name: 'Doe, Ryan', col3: 100),
    StudentScore(name: 'Gosling, Mark', col3: 100),
    StudentScore(name: 'Reynolds, Matt', col3: 100),
    StudentScore(name: 'Hemmings, Luke', col3: 100),
    StudentScore(name: 'Silvan, Kath', col3: 100),
    StudentScore(name: 'Malik, Zayn', col3: 100),
    StudentScore(name: 'Shin, Xyril', col3: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Classes'),
      drawer: AppDrawer(),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BSIT - 1A',
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
                        DataColumn(label: Text('Col3')),
                      ],
                      rows: List.generate(studentScores.length, (index) {
                        final student = studentScores[index];
                        return DataRow(cells: [
                          DataCell(Text('${index + 1}')),
                          DataCell(
                            GestureDetector(
                              onTap: () {
                                _showEditDialog(context, student);
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
                          DataCell(Text('${student.col3}')),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF00796B),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _showEditDialog(BuildContext context, StudentScore student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Student'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Middle Name',
                  ),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Year and Section',
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text('BSIT-1A'),
                      value: 'BSIT-1A',
                    ),
                    DropdownMenuItem(
                      child: Text('BSIT-1B'),
                      value: 'BSIT-1B',
                    ),
                    DropdownMenuItem(
                      child: Text('BSIT-2A'),
                      value: 'BSIT-2A',
                    ),
                  ],
                  onChanged: (value) {
                    // Handle dropdown value change
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle confirm button press
                Navigator.pop(context); // Close the modal
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0C796E),
                foregroundColor: Colors.white,
                shape: CircleBorder(),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Student'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Middle Name',
                  ),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Year and Section',
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text('BSIT-1A'),
                      value: 'BSIT-1A',
                    ),
                    DropdownMenuItem(
                      child: Text('BSIT-1B'),
                      value: 'BSIT-1B',
                    ),
                    DropdownMenuItem(
                      child: Text('BSIT-2A'),
                      value: 'BSIT-2A',
                    ),
                  ],
                  onChanged: (value) {
                    // Handle dropdown value change
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle confirm button press
                Navigator.pop(context); // Close the modal
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0C796E),
                foregroundColor: Colors.white,
                shape: CircleBorder(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class StudentScore {
  final String name;
  final int col3;

  StudentScore({required this.name, required this.col3});
}
