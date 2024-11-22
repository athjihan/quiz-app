import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class StartScreen extends StatelessWidget {
  //stateless  karena dia ga nyimpen track
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/database.svg',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 30),
          const Text(
            'Kuis Database',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Mulai!')),
        ],
      ),
    );
  }
}
