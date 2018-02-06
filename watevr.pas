Program Projekt;
uses Crt;
type
  person = array[1..79] of record
       Name: string;
       GWeA, NawieA, SpracheeA, AntwortMusikKunst  : char;
       GWgA, NawigA, SprachegA, {RelieA,} ReligA, Sport, Wahlfach : char;
       Kunst, Musik : boolean; {kein boolean}
       KFMathe, KFDeutsch : boolean;
  end;
  AnzahlKurse = array[1..27,1..4] of integer;
  KursAnzahl = array[1..27] of integer;

var Elfer, Zwoelfer, p_temp : person;
    i, t, AnzahlKlasse, AnzahlElfer, Anzahl : integer;
    AntwortKunstMusik, WahlfachAntwort : char;
    inter, aktuell, Eingabe1, Ausgabe1 : string;

procedure Eingabenueberpruefung(Eingabe2 : string; Ausgabe2 : char);
  begin
    case Eingabe2 of
      'Englisch': Ausgabe2 := 'E';
      'Franzoesisch' : Ausgabe2 := 'F';
      'Latein' : Ausgabe2 := 'L';
      'Physik' : Ausgabe2 := 'P';
      'Biologie' : Ausgabe2 := 'B';
      'Chemie' : Ausgabe2 := 'C';
    end;
  end;


procedure BerechnungKurse (var AFK : Kursanzahl; var AnzahlKurs : KursAnzahl; var AnzahlSchuelerKurs : AnzahlKurse);
var i : integer;
  begin
    for i := 1 to 27 do
      begin

        if (AFK[i] >= 24) and (AFK[i] <= 48) then
          AnzahlKurs[i] := 2;   {Wie viele Kurse es gibt}

          if AFK[i] mod 2 <> 0 then
            begin
              AnzahlSchuelerKurs[i,1] := AFK[i] div 2 + 1; {Wie viele Schueler pro Kurs}
              AnzahlSchuelerKurs[i,2] := AFK[i] div 2;
            end
          else
            begin
              AnzahlSchuelerKurs[i,1] := AFK[i] div 2;
              AnzahlSchuelerKurs[i,2] := AFK[i] div 2;
            end;

        if (AFK[i] > 48) and (AFK[i] <= 72) then
          AnzahlKurs[i] := 3;

          if AFK[i] mod 3 = 1 then
            begin
              AnzahlSchuelerKurs[i,1] := AFK[i] div 3 + 1;
              AnzahlSchuelerKurs[i,2] := AFK[i] div 3;
              AnzahlSchuelerKurs[i,3] := AFK[i] div 3;
            end;

          if AFK[i] mod 3 = 2 then
            begin
              AnzahlSchuelerKurs[i,1] := AFK[i] div 3 + 1;
              AnzahlSchuelerKurs[i,2] := AFK[i] div 3 + 1;
              AnzahlSchuelerKurs[i,3] := AFK[i] div 3;
            end

          else
            begin
              AnzahlSchuelerKurs[i,1] := AFK[i] div 3;
              AnzahlSchuelerKurs[i,2] := AFK[i] div 3;
              AnzahlSchuelerKurs[i,3] := AFK[i] div 3;
            end;

        if (AFK[i] > 72) and (AFK[i] <= 96) then
          AnzahlKurs[i] := 4;

          if AFK[i] mod 4 = 1 then
            begin
              AnzahlSchuelerKurs[i,1] := AFK[i] div 4 + 1;
              AnzahlSchuelerKurs[i,2] := AFK[i] div 4;
              AnzahlSchuelerKurs[i,3] := AFK[i] div 4;
              AnzahlSchuelerKurs[i,4] := AFK[i] div 4;
            end;

          if AFK[i] mod 4 = 2 then
            begin
              AnzahlSchuelerKurs[i,1] := AFK[i] div 4 + 1;
              AnzahlSchuelerKurs[i,2] := AFK[i] div 4 + 1;
              AnzahlSchuelerKurs[i,3] := AFK[i] div 4;
              AnzahlSchuelerKurs[i,4] := AFK[i] div 4;
            end;

          if AFK[i] mod 4 = 3 then
            begin
              AnzahlSchuelerKurs[i,1] := AFK[i] div 4 + 1;
              AnzahlSchuelerKurs[i,2] := AFK[i] div 4 + 1;
              AnzahlSchuelerKurs[i,3] := AFK[i] div 4 + 1;
              AnzahlSchuelerKurs[i,4] := AFK[i] div 4;
            end

          else
            begin
              AnzahlSchuelerKurs[i,1] := AFK[i] div 4;
              AnzahlSchuelerKurs[i,2] := AFK[i] div 4;
              AnzahlSchuelerKurs[i,3] := AFK[i] div 4;
              AnzahlSchuelerKurs[i,4] := AFK[i] div 4;
            end;

        if AFK[i] <= 24 then
          begin
            AnzahlKurs[i] := 1;
            AnzahlSchuelerKurs[i,1] := AFK[i];
          end;
      end;
  end;

procedure counter(var Kl : person; var AFK : KursAnzahl);
  var n : integer;
  begin
    for n := 1 to AnzahlElfer do
      begin
        if Kl[n].Musik = true then         {Musik ga 1}
          AFK[1] := AFK[1] + 1;
        if Kl[n].Kunst = true then         {Kunst ga 2}
          AFK[2] := AFK[2] + 1;
        if Kl[n].NawieA = 'P' then    {Physik eA 3}
          AFK[3] := AFK[3] + 1;
        if Kl[n].NawieA = 'B' then  {Biologie eA 4}
          AFK[4] := AFK[4] + 1;
        if Kl[n].NawieA = 'C' then    {Chemie eA 5}
          AFK[5] := AFK[5] + 1;
        if Kl[n].GWeA = 'W' then          {WR eA 6}
          AFK[6] := AFK[6] + 1;
        if Kl[n].GWeA = 'S' then {Sozialkunde eA 7}
          AFK[7] := AFK[7] + 1;
        if Kl[n].GWeA = 'G' then    {Geo eA 8}
          AFK[8] := AFK[8] + 1;
        if Kl[n].GWeA = 'Z' then      {Geschichte eA 9}
          AFK[9] := AFK[9] + 1;
        if Kl[n].GWeA = 'R' then      {Religion eA 10}
          AFK[10] := AFK[10] + 1;
        if (Kl[n].NawigA = 'P') or (Kl[n].Wahlfach = 'P') then    {Physik gA 11}
          AFK[11] := AFK[11] + 1;
        if (Kl[n].NawigA = 'B') or (Kl[n].Wahlfach = 'B') then  {Biologie gA 12}
          AFK[12] := AFK[12] + 1;
        if (Kl[n].NawigA = 'C') or (Kl[n].Wahlfach = 'C') then    {Chemie gA 13}
          AFK[13] := AFK[13] + 1;
        if (Kl[n].GWgA = 'W') or (Kl[n].Wahlfach = 'W') then    {WR gA 14}
          AFK[14] := AFK[14]+ 1;
        if (Kl[n].GWgA = 'S') or (Kl[n].Wahlfach = 'S') then {Sozialkunde gA 15}
          AFK[15] := AFK[15] + 1;
        if (Kl[n].GWgA = 'G') or (Kl[n].Wahlfach = 'G') then    {Geo gA 16}
          AFK[16] := AFK[16] + 1;
        if (Kl[n].GWgA = 'Z') or (Kl[n].ReligA = 'Z') then      {Geschichte gA 17}
           AFK[17] := AFK[17] + 1;
        if Kl[n].ReligA = 'R' then      {Religion gA 18}
           AFK[18] := AFK[18] + 1;
        if Kl[n].KFDeutsch then      {Deutsch eA 19}
           AFK[19] := AFK[19] + 1;
        if Kl[n].KFMathe then      {Mathe eA 20}
           AFK[20] := AFK[20] + 1;
        if Kl[n].SpracheeA = 'E' then    {Englisch eA 21}
          AFK[21] := AFK[21] + 1;
        if Kl[n].SpracheeA = 'F' then  {Franz”sisch eA 22}
          AFK[22] := AFK[22] + 1;
        if Kl[n].SpracheeA = 'L' then    {Latein eA 23}
          AFK[23] := AFK[23] + 1;
        if (Kl[n].SprachegA = 'E') or (KL[n].Wahlfach = 'E') then    {Englisch gA 24}
          AFK[24] := AFK[24] + 1;
        if (Kl[n].SprachegA = 'F') or (KL[n].Wahlfach = 'F') then  {Franz”sisch gA 25}
          AFK[25] := AFK[25] + 1;
        if (Kl[n].SprachegA = 'L') or (KL[n].Wahlfach = 'L') then    {Latein gA 26}
          AFK[26] := AFK[26] + 1;
        if (Kl[n].SprachegA = 'A') or (KL[n].Wahlfach = 'A') then    {Altgriechisch gA 27}
          AFK[27] := AFK[27] + 1;
      end;
    end;

procedure Abfrage(var Elfer, Zwoelfer, K : person; Menge, t : integer);
var i : integer;
  begin
    for i := 1 to Menge do
      begin
        clrscr;
        write('Wie heiáen Sie? ');
        readln(K[i].Name);
        write('Sie muessen Mathe und Deutsch mit erhoehtem Anforderungsniveau, auáerdem noch   Seminarfach und Sport');
        writeln(' mit grundlegendem Anforderungsniveau belegen.');
        writeln;
        K[i].KFMathe := true;
        K[i].KFDeutsch := true;

        writeln('Welche eA Fremdsprache haben Sie gewaehlt?');
        readln(Eingabe1);
        Eingabenueberpruefung(Eingabe1, Ausgabe1);
        K[i].SpracheeA := Ausgabe1;
        writeln(K[i].SpracheeA);
        writeln(Ausgabe1);

        writeln('Welche gA Fremdsprache haben Sie gewaehlt?');
        readln(K[i].SprachegA);
        writeln('Welche eA Naturwissenschaft haben Sie gewaehlt?');
        readln(K[i].NawieA);
        writeln('Welche gA Naturwissenschaft haben Sie gewaehlt?');
        readln(K[i].NawigA);
        writeln('Welche eA Gesellschaftswissenschaft haben Sie gewaehlt?'); {WR, Geo, Geschichte, Sozi, Reli als Eingabe}
        readln(K[i].GWeA);

        if K[i].GWeA = 'Z' then   {Geschichte=Z?}
          begin
            write('Welche gA Gesellschaftswissenschaft haben Sie noch gewaehlt?');
            readln(K[i].GWgA);
            writeln('Sie muessen Religion mit grundlegendem Anforderungsniveau machen.');
            K[i].ReligA := 'R'; {!}
          end
        else
          begin
            K[i].GWgA := 'Z'; {Z = Geschichte}
            writeln('Sie muessen Geschichte als gA Gesellschaftswissenschaft nehmen.');
            K[i].ReligA := 'R';
            writeln('Auáerdem muessen sie auch Religion gA nehmen.');
          end;

        if K[i].GWeA = 'R' then
          begin
            writeln('Sie muessen Geschichte gA nehmen.');
            K[i].GWgA := 'Z';   {!!!}
          end;

        write('Haben Sie Musik gew„hlt ? <y/n>');
        readln(K[i].AntwortMusikKunst);
        if K[i].AntwortMusikKunst = 'y' then
          begin
            K[i].Musik := true;
            writeln('Sie haben Musik gewaehlt.');
          end
        else
          begin
            K[i].Kunst := true;
            writeln('Sie haben also Kunst gewaehlt.');
          end;

        write('Haben Sie ein Wahlfach gewaehlt? <y/n> ');
        readln(WahlfachAntwort);
        if WahlfachAntwort = 'y' then
          begin
            write('Welches Wahlfach haben Sie denn gewaehlt ?');
            readln(Elfer[i].Wahlfach);
          end
        else
          writeln('Sie haben also kein Wahlfach gewaehlt.');

        if t = 1 then
          Elfer := K;
        if t = 2 then
          Zwoelfer := K;
    end;
  end;

begin               {HP}
  clrscr;
  textcolor (lightred);
  writeln(' __________ _____________ _____   _____ _____       _____ __________   ____  ');
  writeln(' I        I I           I I   I   I   I I    \      I   I I         \  I  I  ');
  writeln(' I   _____I I____   ____I I   I   I   I I     \     I   I I   ____   \ I__I  ');
  writeln(' I   I          I   I     I   I   I   I I      \    I   I I   I  I   I ____  ');
  writeln(' I   I_____     I   I     I   I   I   I I       \   I   I I   I  I   I I  I  ');
  writeln(' I        I     I   I     I   I   I   I I   I\   \  I   I I   I  I   I I  I  ');
  writeln(' I_____   I     I   I     I   I   I   I I   I \   \ I   I I   I  I   I I  I  ');
  writeln('      I   I     I   I     I   I   I   I I   I  \   \I   I I   I  I   I I  I  ');
  writeln(' _____I   I     I   I     I   I___I   I I   I   \       I I   I__I   I I  I  ');
  writeln(' I        I     I   I     I           I I   I    \      I I          I I  I  ');
  writeln(' I________I     I___I     I___________I I___I     \_____I I_________/  I__I  ');
  textcolor (lightgreen);
  writeln('             __________  ___________  ___________  ___________       ');
  writeln('             I        I  I         I  I         I  I         I       ');
  writeln('             I_____   I  I  _____  I  I  _____  I  I  _____  I       ');
  writeln('                  I   I  I  I   I  I  I  I   I  I  I  I   I  I       ');
  writeln('             _____I   I  I  I   I  I  I  I   I  I  I  I   I  I       ');
  writeln('      / \    I        I  I  I   I  I  I  I   I  I  I  I   I  I    / \   ');
  writeln('      \ /    I   _____I  I  I   I  I  I  I   I  I  I  I   I  I    \ /   ');
  writeln('             I   I       I  I   I  I  I  I   I  I  I  I   I  I       ');
  writeln('             I   I_____  I  I___I  I  I  I___I  I  I  I___I  I       ');
  writeln('             I        I  I         I  I         I  I         I       ');
  writeln('             I________I  I_________I  I_________I  I_________I       ');
  textcolor (white);
  writeln;
  writeln ('                              "Press Enter"        '  );
  readln;
  clrscr;
  writeln;
  writeln ('Hallo!');
  writeln ('Du hast dich fuer die neueste und innovativste M”glichkeit entschieden,');
  writeln ('im 21. Jahrhundert deinen pers”nlichen Stundenplan zu erstellen.');
  writeln ('Dieses Programm kam am 01. Januar 2000 auf den Markt und soll das Leben');
  writeln ('vieler Schueler entscheidend verbessern.');
  textcolor (lightred);
  write ('Stundi');
  textcolor (lightgreen);
  write (' 2000');
  textcolor (white);
  writeln (' „ndert die Art und Weise, wie auf der Welt Stundenpl„ne erstellt werden.');
  writeln ('Da sich das Programm noch am Anfang befindet, wird es fuer die Zeit der ');
  writeln ('Ver”ffentlichung ausschlieálich fuer die Oberstufen in Thueringen.');
  readln;
  writeln('Geben Sie bitte Buchstaben ein!');
  for t := 1 to 2 do
    begin
      if t = 1 then
        aktuell := 'Elfer';
      if t = 2 then
        aktuell := 'Zwoelfer';
      write('Wie viele ',aktuell,' gibt es?');
      readln(Anzahl);
      Abfrage(Elfer, Zwoelfer, p_temp, Anzahl, t);
    end;
readln;
end.
