import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PendingQuestions extends StatelessWidget {
  const PendingQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Pending Question".text.make(),
        leading: IconButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Contact ${(index + 1)}'),
            leading: const Icon(Icons.person_outline_rounded),
            trailing: const Icon(Icons.select_all_rounded),
            onTap: () {
              debugPrint('Contact ${(index + 1)}');
            },
          );
        },
      ),
    );
  }
}
