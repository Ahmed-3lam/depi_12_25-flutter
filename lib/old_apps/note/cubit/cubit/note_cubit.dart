import 'package:bloc/bloc.dart';
import 'package:depi_five/old_apps/note/note_hive_helper.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void getNotes() async {
    emit(NoteLoadingState());
    await NoteHiveHelper.getAllNote();
    emit(NoteSuccessState());
  }

  void addNote(String text) {
    NoteHiveHelper.addNote(text);
    emit(NoteSuccessState());
  }

  void updateNote({required String text, required int i}) {
    NoteHiveHelper.updateNote(text, i);
    emit(NoteSuccessState());
  }

  void deleteAllNotes() {
    NoteHiveHelper.deleteAllNote();
    emit(NoteSuccessState());
  }

  void deleteNote(int i) {
    NoteHiveHelper.deleteNote(i);
    emit(NoteSuccessState());
  }
}
