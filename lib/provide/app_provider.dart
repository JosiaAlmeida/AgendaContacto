import 'dart:math';

import 'package:agendas/data/data.dart';
import 'package:agendas/model/model.dart';
import 'package:flutter/widgets.dart';

class AgendaProvider extends ChangeNotifier {
  Map<String, AgendaUser> items = {...AGENDADATA};

  List<AgendaUser> get AllDataAgenda {
    return [...items.values];
  }

  int get Count {
    return items.length;
  }

  void AddItems(AgendaUser agenda) {
    final id = Random().nextDouble().toString();
    items.putIfAbsent(
        id,
        () => AgendaUser(
            id: id,
            name: agenda.name,
            lastName: agenda.lastName,
            number: agenda.number));
    notifyListeners();
  }

  void Update(AgendaUser agenda) {
    if (items.containsKey(agenda.id)) {
      items.update(
          agenda.id,
          (value) => AgendaUser(
              id: agenda.id,
              name: agenda.name,
              lastName: agenda.lastName,
              number: agenda.number));
      notifyListeners();
    }
  }

  void Delete(String id) {
    if (id != null || !id.isEmpty) {
      items.remove(id);
    }
    notifyListeners();
  }
}
