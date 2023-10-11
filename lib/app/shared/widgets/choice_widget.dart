import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoiceWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ChoiceWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: Get.width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
