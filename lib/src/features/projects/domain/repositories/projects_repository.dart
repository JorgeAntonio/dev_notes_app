import '../entities/projects.dart';
abstract class ProjectsRepository {
  Future<Projects> getProjects(String id);
}