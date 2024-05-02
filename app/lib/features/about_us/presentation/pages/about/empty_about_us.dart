import 'package:flutter/material.dart';

class EmptyAboutUsWidget extends StatelessWidget {
  const EmptyAboutUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Нет данных для отображения',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
