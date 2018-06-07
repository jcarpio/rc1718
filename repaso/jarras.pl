
% Estado
% estado(LitrosJ3, LitrosJ5)

% Movimientos
% Llenar las jarras
% Vaciar las jarras
% Pasar de 3 a 5
% Pasar de 5 a 3

mov(llenarJ3, estado(_, L5), estado(3, L5)).
mov(llenarJ5, estado(L3, _), estado(L3, 5)).
mov(vaciarJ3, estado(_, L5), estado(0, L5)).
mov(vaciarJ5, estado(L3, _), estado(L3, 0)).
mov(pasar3a5, estado(L3, L5), estado(0, LT)):-
  LT is L3 + L5, LT =< 5. % Todo cabe en J5
mov(pasar3a5, estado(L3, L5), estado(L32, 5)):-
  LT is L3 + L5, LT > 5, L32 is LT - 5.
mov(pasar5a3, estado(L3, L5), estado(LT, 0)):-
  LT is L3 + L5, LT =< 3.
mov(pasar5a3, estado(L3, L5), estado(3, L52)):-
  LT is L3 + L5, LT > 3, L52 is LT - 3.

% camino(+EstadoInicial, +EstadoFinal, +Visitados, -Camino)
% Es cierto cuando Camino unifica con una lista de movimientos
% que permiten pasar del EstadoInicial al EstadoFinal

camino(Ei, Ei, _, []).
camino(Ei, Ef, Visitados, [Mov|Camino]):-
  mov(Mov, Ei, ETMP),
  \+ member(ETMP, Visitados),
  camino(ETMP, Ef, [ETMP|Visitados], Camino).

% camino(estado(0,0), estado(_, 4), [estado(0,0)], Camino). 

comparar(<, L1, L2):- length(L1, Long1), length(L2, Long2), 
  Long1 < Long2.
comparar(>, L1, L2):- length(L1, Long1), length(L2, Long2), 
  Long1 > Long2.
comparar(=, L1, L2):- length(L1, Long1), length(L2, Long2), 
  Long1 = Long2.

menor_camino(C, L):- 
  bagof(Camino, camino(estado(0,0), estado(_,4), [estado(0,0)], Camino), B),
  predsort(comparar, B, [C|_]), length(C,L).




