% peano2dec(+P, -D)
% Es cierto cuando D unifica con
% el decimal equivalente
% al numero en aritmética de Peano P
peano2dec(0, 0).
peano2dec(s(P), D2):- peano2dec(P, D),
   D2 is D + 1. 

