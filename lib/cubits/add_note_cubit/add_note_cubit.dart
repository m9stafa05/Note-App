// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errorMessage: e.toString()));
    }
  }
}
