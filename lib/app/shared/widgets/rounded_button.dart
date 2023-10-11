import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isOutlinedColor;

  const RoundedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isOutlinedColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>((isOutlinedColor)
                ? Colors.transparent
                : const Color(
                    0xff23A8CB,
                  )),
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(
                color: Color(0xff23A8CB),
                width: 2,
              ),
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (isOutlinedColor)
                    ? const Color(
                        0xff23A8CB,
                      )
                    : Colors.white,
              ),
            ),
          ),
        ));
  }
}
