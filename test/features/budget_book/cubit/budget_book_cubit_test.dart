import 'package:bloc_test/bloc_test.dart';
import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/budget_book/application/budget_book/cubits/budget_book_cubit.dart';
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/filter_and_group_bookings_use_case.dart';
import 'package:budget_fusion_app/features/budget_book/application/budget_book/use_cases/generate_budget_summary_use_case.dart';
import 'package:budget_fusion_app/features/budget_book/domain/entities/budget_book_filter.dart';
import 'package:budget_fusion_app/features/budget_book/domain/entities/budget_date_range.dart';
import 'package:budget_fusion_app/features/budget_book/domain/entities/budget_page_data.dart';
import 'package:budget_fusion_app/features/budget_book/domain/entities/summary_view_data.dart';
import 'package:budget_fusion_app/features/budget_book/domain/enums/budget_view_mode.dart';
import 'package:budget_fusion_app/features/budget_book/domain/enums/period_mode.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FakeBooking extends Fake implements Booking {}

class FakeBudgetPageData extends Fake implements BudgetPageData {}

class MockGenerateBudgetSummaryUseCase extends Mock implements GenerateBudgetSummaryUseCase {}

class MockFilterAndGroupBookingsUseCase extends Mock implements FilterAndGroupBookingsUseCase {}

class MockWatchBookingsUseCase extends Mock implements WatchBookingsUseCase {}

void main() {
  setUpAll(() {
    registerFallbackValue(<Booking>[]);
    registerFallbackValue(BudgetBookFilter.initial());
    registerFallbackValue(BudgetViewMode.summary);
    registerFallbackValue(<BudgetPageData>[]);
  });

  late MockGenerateBudgetSummaryUseCase mockGenerateBudgetSummaryUseCase;
  late MockFilterAndGroupBookingsUseCase mockFilterAndGroupBookingsUseCase;
  late MockWatchBookingsUseCase mockWatchBookingsUseCase;
  late BudgetBookCubit cubit;

  final dummyRawItems = <Booking>[];
  final dummyFilteredItems = <BudgetPageData>[];
  final dummySummaries = <SummaryViewData>[
    SummaryViewData(
      currency: Currency(id: Uuid(''), name: '', decimalPrecision: 2, unitPositionFront: true, symbol: ''),
      dateRange: BudgetDateRange(
        period: PeriodMode.month,
        from: DateTime(2022, 1, 1),
        to: DateTime(2022, 1, 31),
      ),
      pieData: [],
      summaries: [],
      income: Decimal.parse('0'),
      outcome: Decimal.parse('0'),
    )
  ];

  setUp(() {
    mockGenerateBudgetSummaryUseCase = MockGenerateBudgetSummaryUseCase();
    mockFilterAndGroupBookingsUseCase = MockFilterAndGroupBookingsUseCase();
    mockWatchBookingsUseCase = MockWatchBookingsUseCase();

    when(() => mockWatchBookingsUseCase.call()).thenAnswer((_) => Stream.value(dummyRawItems));
    when(() => mockFilterAndGroupBookingsUseCase.call(any(), any())).thenAnswer((_) async => dummyFilteredItems);
    when(() => mockGenerateBudgetSummaryUseCase.call(any())).thenAnswer((_) async => dummySummaries);

    cubit = BudgetBookCubit(
      mockGenerateBudgetSummaryUseCase,
      mockFilterAndGroupBookingsUseCase,
      mockWatchBookingsUseCase,
    );
  });

  tearDown(() {
    cubit.close();
  });

  blocTest<BudgetBookCubit, BudgetBookState>(
    'emits loading and loaded states when load is successful',
    build: () => cubit,
    act: (cubit) async => await cubit.load(),
    expect: () => [
      predicate<BudgetBookState>((state) => state.maybeWhen(
            loading: (_, __, ___, ____) => true,
            orElse: () => false,
          )),
      predicate<BudgetBookState>((state) => state.maybeWhen(
            loaded: (_, __, ___, ____) => true,
            orElse: () => false,
          )),
    ],
  );

  blocTest<BudgetBookCubit, BudgetBookState>(
    'emits loading and loaded states when updateView is successful',
    build: () => cubit,
    act: (cubit) async => await cubit.updateView(
      filter: BudgetBookFilter.initial(),
      viewMode: BudgetViewMode.summary,
    ),
    expect: () => [
      predicate<BudgetBookState>((state) => state.maybeWhen(
            loading: (_, __, ___, ____) => true,
            orElse: () => false,
          )),
      predicate<BudgetBookState>((state) => state.maybeWhen(
            loaded: (_, __, ___, ____) => true,
            orElse: () => false,
          )),
    ],
  );
}
