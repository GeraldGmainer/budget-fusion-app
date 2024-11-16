import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftDrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuState = Provider.of<LeftDrawerMenuState>(context);
    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, anim) => RotationTransition(
          turns: menuState.isMenuOpen ? Tween<double>(begin: 1, end: 0.75).animate(anim) : Tween<double>(begin: 0.75, end: 1).animate(anim),
          child: ScaleTransition(scale: anim, child: child),
        ),
        child: menuState.isMenuOpen
            ? const Icon(Icons.arrow_upward)
            : const Icon(
                Icons.filter_list,
                key: ValueKey('icon2'),
              ),
      ),
      onPressed: () {
        menuState.toggleMenu();
      },
    );
  }
}

class LeftDrawerMenuState extends ChangeNotifier {
  bool _isMenuOpen = false;

  bool get isMenuOpen => _isMenuOpen;

  void toggleMenu() {
    _isMenuOpen = !_isMenuOpen;
    notifyListeners();
  }
}
