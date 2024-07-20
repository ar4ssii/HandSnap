import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final VoidCallback? onTap;

  QuestionCard({required this.questionNumber, required this.questionText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black54, width: 1.5),

      ),
      child: ListTile(
        title: Text('Question #$questionNumber'),
        subtitle: Text(questionText),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
