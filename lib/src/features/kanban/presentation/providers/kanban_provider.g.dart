// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanban_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(KanbanNotifier)
final kanbanProvider = KanbanNotifierProvider._();

final class KanbanNotifierProvider
    extends $AsyncNotifierProvider<KanbanNotifier, void> {
  KanbanNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'kanbanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$kanbanNotifierHash();

  @$internal
  @override
  KanbanNotifier create() => KanbanNotifier();
}

String _$kanbanNotifierHash() => r'cb309c886ce75f3f803edf7d3f41537ff9ff1372';

abstract class _$KanbanNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
