import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String _timeUntilExam() {
    final now = DateTime.now();
    final timeDiff = exam.dateTime.difference(now);

    final days = timeDiff.inDays;
    final hours = timeDiff.inHours.remainder(24);

    if (timeDiff.isNegative) {
      return 'Испитот поминал';
    } else {
      return 'До испитот преостануваат: $days дена, $hours часа';
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Scaffold(
      appBar: AppBar(title: Text(exam.subjectName)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all(color: Colors.black)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Предмет: ${exam.subjectName}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Датум: ${dateFormat.format(exam.dateTime)}'),
                Text('Време: ${timeFormat.format(exam.dateTime)}'),
                Text('Простории: ${exam.rooms.join(', ')}'),
                const SizedBox(height: 16),

                Text(
                  _timeUntilExam(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}