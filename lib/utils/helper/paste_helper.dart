import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef ValueParser<T> = T? Function(String input);

class PasteHelper {
  /// Shows a single-item “Paste” menu at [position], reads the clipboard,
  /// parses with [parser], and either calls [onValid] or [onInvalid].
  static Future<void> showPasteMenuAt<T>({
    required BuildContext context,
    required Offset position,
    required ValueParser<T> parser,
    required ValueChanged<T> onValid,
    required VoidCallback onInvalid,
  }) async {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final size = overlay.size;
    final menuPosition = RelativeRect.fromLTRB(position.dx, position.dy, size.width - position.dx, size.height - position.dy);

    final choice = await showMenu<String>(context: context, position: menuPosition, items: [PopupMenuItem(value: 'paste', child: Text('Paste').tr())]);
    if (!context.mounted) return;

    if (choice == 'paste') {
      final data = await Clipboard.getData(Clipboard.kTextPlain);
      final text = data?.text?.trim() ?? '';
      final parsed = parser(text);
      if (parsed != null) {
        onValid(parsed);
      } else {
        onInvalid();
      }
    }
  }
}
