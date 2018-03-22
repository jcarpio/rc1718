% elemento_enesimo(+Pos, +Lista, -Elem)
% Es cierto cuando Elem unifica con el
% elemento que ocupa la posición Pos de Lista
% empezando por 0.
elemento_enesimo(0, [E|_], E).
elemento_enesimo(Pos, [_|Resto], E):- Pos > 0,
   Pos2 is Pos - 1, elemento_enesimo(Pos2, Resto, E).
 