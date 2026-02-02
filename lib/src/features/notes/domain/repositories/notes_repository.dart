import '../entities/notes.dart';
abstract class NotesRepository {
  Future<Notes> getNotes(String id);
}