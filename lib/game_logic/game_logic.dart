import 'dart:core';
import 'gamefield.dart';

class GameLogic {

	late Gamefield _spielfeld;
  late int _aktuellerSpieler;
  late int _gewinner;

    GameLogic()
    {
        _spielfeld = Gamefield();
        _aktuellerSpieler = 1;
        _gewinner = -1;
    }

    int gibAktuellenSpieler()
    {
        return _aktuellerSpieler;
    }

    void wechsleSpieler()
    {
        _aktuellerSpieler = 3 - _aktuellerSpieler;
    }

    bool spielIstZuende()
    {
        return _gewinner != -1;
    }

    int gibGewinner()
    {
        return _gewinner;
    }

    int gibBesitzer(int zeile, int spalte)
    {
        return _spielfeld.gibBesitzer(zeile, spalte);
    }

    bool istFrei(int zeile, int spalte)
    {
        return gibBesitzer(zeile, spalte) == 0;
    }

    void besetzePosition(int zeile, int spalte)
    {
        if (!spielIstZuende() && istFrei(zeile, spalte))
        {
            _spielfeld.besetzePosition(zeile, spalte, _aktuellerSpieler);

            if (aktuellerSpielerHatGewonnen())
            {
                _gewinner = _aktuellerSpieler;
            }
            else if (_spielfeld.istVoll())
            {
                _gewinner = 0;
            }
            else
            {
                wechsleSpieler();
            }
        }
    }

    bool aktuellerSpielerBesitzt(int pos1Zeile, int pos1Spalte,
                                            int pos2Zeile, int pos2Spalte,
                                            int pos3Zeile, int pos3Spalte)
    {
        return aktuellerSpielerBesitztFeld(pos1Zeile,pos1Spalte)
           &&  aktuellerSpielerBesitztFeld(pos2Zeile,pos2Spalte)
           &&  aktuellerSpielerBesitztFeld(pos3Zeile,pos3Spalte);
    }
    
    bool aktuellerSpielerBesitztFeld(int zeile, int spalte)
    {
        return gibBesitzer(zeile,spalte) == gibAktuellenSpieler();
    }

    bool aktuellerSpielerHatGewonnen()
    {
        return aktuellerSpielerBesitzt(0,0 , 0,1 , 0,2) // Zeile 0
            || aktuellerSpielerBesitzt(1,0 , 1,1 , 1,2) // Zeile 1
            || aktuellerSpielerBesitzt(2,0 , 2,1 , 2,2) // Zeile 2

            || aktuellerSpielerBesitzt(0,0 , 1,0 , 2,0) // Spalte 0
            || aktuellerSpielerBesitzt(0,1 , 1,1 , 2,1) // Spalte 1
            || aktuellerSpielerBesitzt(0,2 , 1,2 , 2,2) // Spalte 2

            || aktuellerSpielerBesitzt(0,0 , 1,1 , 2,2) // Diagonale 1
            || aktuellerSpielerBesitzt(0,2 , 1,1 , 2,0);// Diagonale 2
    }
}
