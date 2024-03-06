import 'GamefieldRow.dart';

class Gamefield {
  late List<GamefieldRow> _zeilen;

  Gamefield() {
    _zeilen = List<GamefieldRow>.generate(3, (index) => GamefieldRow());
  }

  int gibBesitzer(int zeile, int spalte) {
    if (zeile < 0 || zeile > 2) {
      throw ArgumentError.value(zeile);
    }
    return _zeilen[zeile].gibBesitzer(spalte);
  }

  void besetzePosition(int zeile, int spalte, int spieler) {
    if (zeile < 0 || zeile > 2) {
      throw ArgumentError.value(zeile);
    }
    _zeilen[zeile].besetze(spalte, spieler);
  }

  bool istVoll() {
    return _zeilen.every((row) => row.istVoll());
  }
}
