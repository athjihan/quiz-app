import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final bool isCorrect =
                data['user-answer'] == data['correct-answer'];
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCorrect
                          ? const Color.fromARGB(255, 74, 142, 77)
                          : const Color.fromARGB(255, 151, 40, 32),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Pastikan semua sejajar di kiri
                      children: [
                        // Menampilkan teks pertanyaan
                        Text(
                          data['question'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 5),

                        // Menampilkan jawabanmu dan kunci jawaban di bawahnya
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // Supaya tetap sejajar
                          children: [
                            // Baris Jawabanmu
                            RichText(
                              text: TextSpan(
                                text: 'Jawabanmu: ',
                                style: const TextStyle(
                                  color: Color.fromARGB(143, 255, 255, 255),
                                ),
                                children: [
                                  TextSpan(
                                    text: data['user-answer'] as String,
                                    style: TextStyle(
                                        color: isCorrect
                                            ? Color.fromARGB(255, 63, 113, 65)
                                            : const Color.fromARGB(
                                                255, 151, 40, 32),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Baris Kunci Jawaban
                            RichText(
                              text: TextSpan(
                                text: 'Kunci jawaban: ',
                                style: const TextStyle(
                                  color: Color.fromARGB(143, 255, 255, 255),
                                ),
                                children: [
                                  TextSpan(
                                    text: data['correct-answer'] as String,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
