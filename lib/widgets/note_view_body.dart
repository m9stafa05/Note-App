import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_app_bar.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [CustomAppBar()]),
    );
  }
}
