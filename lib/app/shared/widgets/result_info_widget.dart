import 'package:flutter/material.dart';

class ResultInfoWidget extends StatelessWidget {
  final String question;
  final String correctAnswer;
  final String userAnswer;

  const ResultInfoWidget({
    super.key,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
        right: 30,
        left: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              if (correctAnswer != userAnswer) ...[
                const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                Text(
                  userAnswer,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              const Icon(
                Icons.check,
                color: Colors.green,
              ),
              Flexible(
                child: Text(
                  correctAnswer,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
