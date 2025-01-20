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

  factory Uuid.fromJson(String json) {
    return Uuid(json);
  }

  String toJson() => value;

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) => identical(this, other) || (other is Uuid && other.value == value);

  @override
  int get hashCode => value.hashCode;
}
