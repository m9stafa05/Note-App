import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/views/note_view.dart';

// flutter build web --release && firebase init hosting && firebase deploy --only hosting -m 'V 1.0.0'
// firebase deploy --only hosting -m ' V 1.0.1'
//flutter build web --release && firebase deploy --only hosting -m 'V 1.0.1'
void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNoteBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NoteView.id: (context) => const NoteView(),
        EditNoteView.id: (context) => const EditNoteView(),
      },
      initialRoute: NoteView.id,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF393939),
        fontFamily: 'Poppins',
      ),
    );
  }
}
