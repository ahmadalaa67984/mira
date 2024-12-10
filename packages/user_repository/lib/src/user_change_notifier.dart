import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserChangeNotifier with ChangeNotifier, EquatableMixin {
  UserChangeNotifier();

  final ValueNotifier<dynamic> _drawerAssociator = ValueNotifier(null);

  /// This is used to carry either Task, Contact, Deal, or Company
  /// to the [AssociateWithDrawer]
  dynamic get drawerAssociator => _drawerAssociator.value;
  void setDrawerAssociator(dynamic associator) {
    _drawerAssociator.value = associator;
    notifyListeners();
  }
  Future clearDrawerAssociator() async {
    _drawerAssociator.value = null;
    notifyListeners();
  }

  @override
  List<Object?> get props => [
        _drawerAssociator,
      ];
}
