import 'package:flutter/material.dart';
import 'package:future_job_app/theme.dart';

class Requirements extends StatelessWidget {
  // const Requirements({Key? key}) : super(key: key);

  final String text;

  const Requirements({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Image.asset(
            'assets/dot.png',
            width: 12,
            height: 12,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: subrequirementsStyle,
          ),
        ],
      ),
    );
  }
}
