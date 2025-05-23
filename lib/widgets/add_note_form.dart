import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_bottom.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: 'Content',
            maxLines: 7,
            onSaved: (value) {
              content = value;
            },
          ),
          const SizedBox(height: 32),
          CustomBottomSheet(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var noteModel = NoteModel(
                  title: title!,
                  content: content!,
                  // ignore: deprecated_member_use
                  color: Colors.blue.value,
                  date: formatFriendlyDate(DateTime.now()),
                );
                BlocProvider.of<AddNoteCubit>(
                  context,
                ).addNote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
String formatFriendlyDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(Duration(days: 1));
  final dateToCheck = DateTime(date.year, date.month, date.day);

  String time = DateFormat('h:mm a').format(date);

  if (dateToCheck == today) {
    return 'Today at $time';
  } else if (dateToCheck == yesterday) {
    return 'Yesterday at $time';
  } else if (now.difference(date).inDays < 7) {
    return '${DateFormat('EEEE').format(date)} at $time'; // e.g., Monday at 3:00 PM
  } else {
    return '${DateFormat('MMM d, yyyy').format(date)} at $time'; // e.g., May 20, 2025 at 3:00 PM
  }
}
