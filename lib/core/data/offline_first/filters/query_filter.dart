import 'query_operator.dart';

class QueryFilter {
  final String column;
  final dynamic value;
  final QueryOperator operator;

  const QueryFilter({
    required this.column,
    required this.value,
    this.operator = QueryOperator.equal,
  });
}
