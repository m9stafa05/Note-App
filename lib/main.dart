import 'package:flutter/material.dart';
import 'package:note_app/views/note_view.dart';

// flutter build web --release && firebase init hosting && firebase deploy --only hosting -m 'V 1.0.0'
// firebase deploy --only hosting -m ' V 1.0.1'
//flutter build web --release && firebase deploy --only hosting -m 'V 1.0.1'
void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {NoteView.id: (context) => const NoteView()},
      initialRoute: NoteView.id,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey,
      ),
      title: 'Note App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Note App'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: NoteView(),
      ),
    );
  }
}
