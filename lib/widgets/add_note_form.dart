import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colors_list_view.dart';
import 'package:note_app/widgets/custom_bottom.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:note_app/widgets/show_snack_bar.dart';

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
          const ColorListView(),
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
                ShowSnackBar(
                  context,
                  message: 'Note Added Successfully',
                  color: Colors.green,
                );
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
