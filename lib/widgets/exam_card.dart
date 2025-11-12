import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final bool isPast;

  const ExamCard({
    super.key,
    required this.exam,
    required this.isPast,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Card(
      color: isPast ? Colors.grey.shade200 : Colors.green.shade50,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: Icon(
          isPast ? Icons.check_circle : Icons.schedule,
          color: isPast ? Colors.grey : Colors.green,
        ),
        title: Text(exam.subjectName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text(dateFormat.format(exam.dateTime)),
                const SizedBox(width: 10),
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(timeFormat.format(exam.dateTime)),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.meeting_room, size: 16),
                const SizedBox(width: 4),
                Text(exam.rooms.join(', ')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}