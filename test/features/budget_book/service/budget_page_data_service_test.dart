import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/budget_book/domain/entities/budget_book_filter.dart';
import 'package:budget_fusion_app/features/budget_book/domain/enums/period_mode.dart';
import 'package:budget_fusion_app/features/budget_book/domain/service/budget_page_data_service.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCategoryRepo extends Mock implements CategoryRepo {}

class MockDatetimeService extends Mock implements DatetimeService {}

void main() {
  late MockCategoryRepo mockCategoryRepo;
  late DatetimeService mockDatetimeService;
  late BudgetPageDataService service;
  late Account account1;
  late Category category1;
  late Category category2;
  late Booking booking1;
  late Booking booking2;
  late Booking booking3;

  Account createAccount(String name) {
    return Account(
      id: Uuid.generate(),
      userId: Uuid.generate(),
      name: name,
      iconName: 'iconName',
      iconColor: 'iconColor',
      updatedAt: DateTime.now(),
    );
  }

  Category createCategory(String name, CategoryType type) {
    return Category(
      id: Uuid.generate(),
      userId: Uuid.generate(),
      name: name,
      parent: null,
      iconName: 'iconName',
      iconColor: 'iconColor',
      categoryType: type,
      updatedAt: DateTime.now(),
    );
  }

  Booking createBooking(DateTime date, int amount, Account account, Category category) {
    return Booking(
      id: Uuid.generate(),
      userId: Uuid.generate(),
      description: "description",
      date: date,
      amount: Decimal.fromInt(amount),
      account: account,
      category: category,
      updatedAt: DateTime.now(),
    );
  }

  setUp(() {
    mockCategoryRepo = MockCategoryRepo();
    mockDatetimeService = MockDatetimeService();
    service = BudgetPageDataService(mockCategoryRepo, mockDatetimeService);

    account1 = createAccount("cash");
    category1 = createCategory("Salary", CategoryType.income);
    category2 = createCategory("Food", CategoryType.outcome);
    booking1 = createBooking(DateTime(2022, 1, 10), 1000, account1, category1);
    booking2 = createBooking(DateTime(2022, 1, 15), 200, account1, category2);
    booking3 = createBooking(DateTime(2022, 1, 10), 44, account1, category2);

    when(() => mockDatetimeService.now()).thenReturn(DateTime(2022, 3, 1));
  });

  group('BudgetPageDataService load for month period', () {
    test('returns empty BudgetPageData when bookings list is empty', () async {
      final filter = BudgetBookFilter.initial().copyWith(period: PeriodMode.month);
      final result = await service.load([], filter);
      expect(result.length, 1);
      expect(result.first.dateRange.period, PeriodMode.month);
    });

    test('generates BudgetPageData for each month with correct totals', () async {
      when(() => mockCategoryRepo.watch()).thenAnswer((_) => Stream.value([category1, category2]));
      final filter = BudgetBookFilter.initial().copyWith(period: PeriodMode.month);
      final bookings = [booking1, booking2, booking3];

      final result = await service.load(bookings, filter);

      expect(result.length, 3);

      expect(result[0].dateRange.from, DateTime(2022, 1, 1));
      expect(result[0].dateRange.to, DateTime(2022, 1, 31).endOfDay);
      expect(result[0].income, Decimal.parse('1000'));
      expect(result[0].outcome, Decimal.parse('244'));

      expect(result[1].dateRange.from, DateTime(2022, 2, 1));
      expect(result[1].dateRange.to, DateTime(2022, 2, 28).endOfDay);
      expect(result[1].income, Decimal.zero);
      expect(result[1].outcome, Decimal.zero);

      expect(result[2].dateRange.from, DateTime(2022, 3, 1));
      expect(result[2].dateRange.to, DateTime(2022, 3, 31).endOfDay);
      expect(result[2].income, Decimal.zero);
      expect(result[2].outcome, Decimal.zero);
    });
  });
}
