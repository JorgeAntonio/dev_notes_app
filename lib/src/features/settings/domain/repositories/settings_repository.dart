import '../entities/settings.dart';
abstract class SettingsRepository {
  Future<Settings> getSettings(String id);
}