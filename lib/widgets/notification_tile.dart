import 'package:flutter/material.dart';

class TextPreviewWidget extends StatefulWidget {
  final String exercise;
  final String exerciseName;

  const TextPreviewWidget(
      {super.key, required this.exercise, required this.exerciseName});

  @override
  _TextPreviewWidgetState createState() => _TextPreviewWidgetState();
}

class _TextPreviewWidgetState extends State<TextPreviewWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.grey[100],
      ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: isExpanded ? 35 : 200,
            // Change the height here
            child: ListTile(
              title: Text(
                widget.exerciseName.trim(),
                maxLines: isExpanded ? null : 10,
                // Change the number of lines here
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          TextButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(isExpanded ? 'Read more' : 'Read less'),
          ),
        ],
      ),
    );
  }
}