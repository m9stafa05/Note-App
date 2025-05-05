import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CustomTextField(hintText: 'Title'),
          const SizedBox(height: 20),
          CustomTextField(hintText: 'Content', maxLines: 7),
        ],
      ),
    );
  }
}