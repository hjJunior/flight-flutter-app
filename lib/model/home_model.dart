import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class HomeModel extends Model {
  int _countOpenFlightTickets = 0;

  bool get showFab => _countOpenFlightTickets >= 1;

  void incrementOpenFlightTickets() {
    _countOpenFlightTickets++;

    notifyListeners();
  }

  void decrementOpenFlightTickets() {
    _countOpenFlightTickets--;

    notifyListeners();
  }


  static HomeModel of(BuildContext context) =>
    ScopedModel.of<HomeModel>(context);
}