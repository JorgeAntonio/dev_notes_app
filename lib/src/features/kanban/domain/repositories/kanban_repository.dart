import '../entities/kanban.dart';
abstract class KanbanRepository {
  Future<Kanban> getKanban(String id);
}