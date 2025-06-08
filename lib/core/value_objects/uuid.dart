import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'uuid.g.dart';

@JsonSerializable()
class Uuid {
  final String value;

  const Uuid(this.value);

  factory Uuid.generate() => Uuid(_generateUuidV4());

  static String _generateUuidV4() {
    final rng = Random.secure();
    final bytes = List<int>.generate(16, (_) => rng.nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    final buffer = StringBuffer();
    for (var i = 0; i < bytes.length; i++) {
      buffer.write(bytes[i].toRadixString(16).padLeft(2, '0'));
      if ([3, 5, 7, 9].contains(i)) buffer.write('-');
    }
    return buffer.toString();
  }

  static List<int> parseJson(String json) {
    final hex = json.replaceAll('-', '').toLowerCase();
    if (hex.length != 32) {
      throw FormatException('Invalid UUID string: $json');
    }
    final bytes = <int>[];
    for (var i = 0; i < 32; i += 2) {
      final byteHex = hex.substring(i, i + 2);
      bytes.add(int.parse(byteHex, radix: 16));
    }
    return bytes;
  }

  @override
  String toString() => value;

  factory Uuid.fromJson(String json) => Uuid(json);

  @override
  bool operator ==(Object other) => identical(this, other) || (other is Uuid && other.value == value);

  @override
  int get hashCode => value.hashCode;
}
