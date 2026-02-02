class Routes {
  const Routes._({required this.name, required this.path});
  final String name;
  final String path;

  static Routes get splash => const Routes._(name: 'splash', path: '/splash');
  static Routes get auth => const Routes._(name: 'auth', path: '/auth');
  static Routes get projects => const Routes._(name: 'projects', path: '/projects');
  static Routes get kanban => const Routes._(name: 'kanban', path: '/kanban');
  static Routes get notes => const Routes._(name: 'notes', path: '/notes');
  static Routes get settings => const Routes._(name: 'settings', path: '/settings');
}
