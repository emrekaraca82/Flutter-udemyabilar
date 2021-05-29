import 'package:abilar/yardimcilar/islemler.dart';
import 'package:flutter/material.dart';

class AtaWidget extends InheritedWidget {
  final Islemler islem;
  AtaWidget({
    Key key,
    @required Widget child,
    this.islem,
  }) : super(key: key, child: child);

  static AtaWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AtaWidget);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
