import 'package:flutter/material.dart';

class Emoticonface extends StatelessWidget {
  final String emotionFace;

  const Emoticonface({super.key, required this.emotionFace});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[600], borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Text(
          emotionFace,
          style: TextStyle(
            fontSize: 28
          ),
        ),
      ),
    );
  }
}
