import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart' as u;

part 'uuid.g.dart';

@JsonSerializable()
class Uuid {
  final String value;

  const Uuid(this.value);

  factory Uuid.generate() {
    return Uuid(u.Uuid().v4());
  }

  @override
  String toString() => "Uuid($value)";

  factory Uuid.fromJson(String json) => Uuid(json);

  @override
  bool operator ==(Object other) => identical(this, other) || (other is Uuid && other.value == value);

  @override
  int get hashCode => value.hashCode;
}
