import 'package:flutter/material.dart';
import '../../includes/drawer_widget.dart';
import '../../includes/CategoryCard2.dart';
import '../../includes/custom_app_bar.dart';
import '../../Main Tools/camera_screen.dart';

class SnapCodePage extends StatelessWidget {
  final int questionNumber;
  final List<StudentNames> studentNames;

  SnapCodePage({required this.questionNumber, required this.studentNames});

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
              Text(
                'Activity # 1 / Question # $questionNumber / BSIT-1A',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...studentNames.map(
                    (student) => CategoryCard2(
                  title: student.name,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraScreen(),
                      ),
                    );
                  },
                ),
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }
}


class StudentNames {
  final String name;

  StudentNames({required this.name});
}

