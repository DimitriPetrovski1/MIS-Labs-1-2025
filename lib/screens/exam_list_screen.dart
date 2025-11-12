import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> _getExams() {
    return [
      Exam(subjectName: 'Мобилни апликации', dateTime: DateTime(2025, 11, 20, 9, 0), rooms: ['A1']),
      Exam(subjectName: 'Веб програмирање', dateTime: DateTime(2025, 12, 22, 10, 0), rooms: ['B2']),
      Exam(subjectName: 'Бази на податоци', dateTime: DateTime(2025, 12, 25, 8, 30), rooms: ['A2']),
      Exam(subjectName: 'Оперативни системи', dateTime: DateTime(2025, 12, 27, 12, 0), rooms: ['B1']),
      Exam(subjectName: 'Алгоритми', dateTime: DateTime(2025, 1, 29, 11, 0), rooms: ['Lab1']),
      Exam(subjectName: 'Мрежи', dateTime: DateTime(2025, 2, 1, 9, 0), rooms: ['C1']),
      Exam(subjectName: 'Објектно програмирање', dateTime: DateTime(2025, 7, 3, 10, 30), rooms: ['A3']),
      Exam(subjectName: 'Интернет технологии', dateTime: DateTime(2025, 5, 5, 13, 0), rooms: ['Lab2']),
      Exam(subjectName: 'Информациски системи', dateTime: DateTime(2025, 9, 7, 8, 0), rooms: ['B3']),
      Exam(subjectName: 'Машинско учење', dateTime: DateTime(2025, 10, 10, 9, 30), rooms: ['Lab3']),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final exams = _getExams()..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 226116', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.red,

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                final isPast = exam.dateTime.isBefore(DateTime.now());

                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ExamDetailScreen(exam: exam),
                    ),
                  ),
                  child: ExamCard(exam: exam, isPast: isPast),
                );
              },
            ),
          ),
          Container(
            color: Colors.red.shade500,
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.school, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  'Вкупно испити: ${exams.length}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}