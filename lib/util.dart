import 'package:flutter/material.dart';

import 'components/hero_dialog_route.dart';

pushHeroDialog(context, Widget child, [bool barrierDismissible = false]) {
  Navigator.of(context).push(HeroDialogRoute(
      dismissible: barrierDismissible,
      builder: (context) {
        return child;
      }));
}
