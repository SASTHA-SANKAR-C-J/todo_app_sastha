import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  const NextScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.date});
  final String title;
  final String description;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(date)],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
