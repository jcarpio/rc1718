% Problema de los caníbales y misioneros

% 1. Definición del estado
% estado(Num_mi_izq, Num_can_izq, Pos_barca)


% 1.1. Definición del estado inicial
%     estado(3, 3, izq)

% 1.2. Definición del estado final
%     estado(0, 0, _)

% 2. Definición de los movimientos
%
%   mov(Nombre, Estado_anterior, Estado_posterior) 

% mov(un_mis_izq, estado(Mi_izq, Ca_izq, dcha),
%                estado(Mi_izq_2, Ca_izq, izq)):-
%         Mi_izq < 3, Mi_izq_2 is Mi_izq + 1.

% mov(un_mis_dch, estado(Mi_izq, Ca_izq, izq),
%                 estado(Mi_izq_2, Ca_izq, izq)):-
%         Mi_izq < 0, Mi_izq_2 is Mi_izq - 1.

pasar(1,0,izq).
pasar(1,0,dch).
pasar(0,1,izq).
pasar(0,1,dch).
pasar(2,0,izq).
pasar(2,0,dch).
pasar(0,2,izq).
pasar(0,2,dch).
pasar(1,1,izq).
pasar(1,1,dch).

mov(pasar(M, C, izq), estado(MI,CI, dch), estado(MD, CD, izq)):-
  pasar(M,C,izq),
  NT is M + C, NT =< 2, NT >= 1,
  M =< MI, C =< CI, 
  MD is MI + M, CD is CI + C.

mov(pasar(M, C, dch), estado(MI, CI, izq), estado(MD, CD, dch)):-
  pasar(M,C,dch),
  NT is M + C, NT =< 2, NT >= 1,
  M =< MI, C =< CI, 
  MD is MI -M, CD is CI - C.

/* camino(+Estado_inicial, +Estado_final, +Visitados, -Camino)
es cierto cuando Estado_inicial y Estado_final unifican con estados válido, Vi
sitados unifica con una lista de estados visitados. */

camino(Inicio, Inicio, _, []).
camino(Inicio, Fin, Visitados, [Mov|Camino]):-
  length(Visitados, L), L < 10,
  mov(Mov, Inicio, Int),
  \+ member(Int, Visitados),
  camino(Int, Fin, [Int|Visitados], Camino).

