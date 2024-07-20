import 'package:flutter/material.dart';
import '../../includes/drawer_widget.dart';
import '../../includes/CategoryCard2.dart';
import '../../includes/custom_app_bar.dart';
import 'ClassList.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClassesPage(),
  ));
}

class ClassesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Classes'),
      drawer: AppDrawer(),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryCard2(
                title: 'BSIT - 1A',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClassListPage()),
                  );
                },
              ),
              CategoryCard2(
                title: 'BSIT - 1B',
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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add New Class'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Course',
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Select Year Level',
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text('1'),
                            value: '1',
                          ),
                          DropdownMenuItem(
                            child: Text('2'),
                            value: '2',
                          ),
                          DropdownMenuItem(
                            child: Text('3'),
                            value: '3',
                          ),
                          DropdownMenuItem(
                            child: Text('4'),
                            value: '4',
                          ),
                        ],
                        onChanged: (value) {
                          // Handle dropdown value change
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Section',
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
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF00796B),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

