import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/repos/category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class InMemoryRepo<T extends Entity> implements Repo<T> {
  final _controller = StreamController<List<T>>.broadcast();
  List<T> _items = const [];

  @override
  Future<List<T>> loadAll({Map<String, dynamic>? filters}) async => _items;

  @override
  Stream<List<T>> watch() => _controller.stream;

  void seed(List<T> items) {
    _items = items;
    _controller.add(items);
  }

  @override
  Future<void> disposeStreams() async => _controller.close();

  @override
  void setupStreams() {}

  @override
  Future<List<T>> getAll() async => _items;
}

class MockQueueManager extends Mock implements QueueManager {}

extension _FindDot on WidgetTester {
  Future<Color?> firstDotColor() async {
    for (final e in find.byType(Container).evaluate()) {
      final w = e.widget;
      if (w is Container && w.decoration is BoxDecoration) {
        final d = w.decoration as BoxDecoration;
        if (d.shape == BoxShape.circle) {
          return d.color;
        }
      }
    }
    return null;
  }
}

Category _category(String id) => Category(
  id: Uuid(id),
  name: 'Cat $id',
  iconName: 'mdi:star',
  iconColor: '#FFFFFF',
  categoryType: CategoryType.outcome,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);

QueueItem _pending({required String id, required QueueTaskType task, QueuePauseReason? pause, String? lastError, int attempts = 0}) {
  return QueueItem(
    entityId: id,
    entityType: EntityType.category,
    entityPayload: '{}',
    taskType: task,
    pauseReason: pause,
    lastError: lastError,
    attempts: attempts,
    done: false,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late InMemoryRepo<Category> repo;
  late MockQueueManager qm;
  final gi = GetIt.I;

  setUp(() {
    if (gi.isRegistered<QueueManager>()) gi.unregister<QueueManager>();
    qm = MockQueueManager();
    gi.registerSingleton<QueueManager>(qm);
    repo = InMemoryRepo<Category>();

    when(() => qm.pendingSnapshot).thenReturn(const []);
    when(() => qm.pendingItemsStream).thenAnswer((_) => const Stream.empty());
  });

  tearDown(() async {
    await repo.disposeStreams();
    if (gi.isRegistered<QueueManager>()) gi.unregister<QueueManager>();
  });

  Future<void> pumpEntity(WidgetTester tester, String id) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EntityMetaDisplay<Category>(
            id: Uuid(id),
            repo: repo,
            navigateBackAfterDelete: false,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('up-to-date is displayed', (tester) async {
    final id = 'id-A';
    repo.seed([_category(id)]);

    await pumpEntity(tester, id);

    final dot = await tester.firstDotColor();
    expect(dot, AppColors.entityUpToDate);
  });

  testWidgets('pending upsert is displayed', (tester) async {
    final id = 'id-B';
    repo.seed([_category(id)]);

    final ctrl = StreamController<List<QueueItem>>();
    when(() => qm.pendingItemsStream).thenAnswer((_) => ctrl.stream);
    when(() => qm.pendingSnapshot).thenReturn([_pending(id: id, task: QueueTaskType.upsert)]);

    await pumpEntity(tester, id);
    ctrl.add([_pending(id: id, task: QueueTaskType.upsert)]);
    await tester.pumpAndSettle();

    final dot = await tester.firstDotColor();
    expect(dot, AppColors.entityPending);
  });

  testWidgets('attemptsExhausted is displayed', (tester) async {
    final id = 'id-C';
    repo.seed([_category(id)]);

    final ctrl = StreamController<List<QueueItem>>();
    when(() => qm.pendingItemsStream).thenAnswer((_) => ctrl.stream);
    when(() => qm.pendingSnapshot).thenReturn([
      _pending(
        id: id,
        task: QueueTaskType.upsert,
        pause: QueuePauseReason.attemptsExhausted,
        lastError: 'duplicate key',
        attempts: 3,
      ),
    ]);

    await pumpEntity(tester, id);
    ctrl.add(qm.pendingSnapshot);
    await tester.pumpAndSettle();

    final dot = await tester.firstDotColor();
    expect(dot, AppColors.entityError);
  });
}
