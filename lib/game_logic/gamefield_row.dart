class GamefieldRow {

	late List<int> _spalten;

    GamefieldRow() {
      _spalten = List.generate(3, (index) => 0);
    }

    int gibBesitzer(int spalte)
    {
    	return _spalten.elementAt(spalte);
    }

    void besetze(int spalte, int spieler)
    {
    	_spalten[spalte] = spieler;
    }

    bool istVoll()
    {
        return _spalten.every((element) => element != 0);
    }
}
